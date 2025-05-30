package org.zerock.persistence;

import java.sql.*;
import java.util.*;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.zerock.domain.MemoDTO;

@Repository
public class MemoDAOImpl implements MemoDAO {

    @Autowired
    private DataSource ds;

    @Override
    public void insertMemo(MemoDTO memo) {
        String sql = "INSERT INTO calendar_memo (year, month, day, memo) VALUES (?, ?, ?, ?)";
        try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, memo.getYear());
            pstmt.setInt(2, memo.getMonth());
            pstmt.setInt(3, memo.getDay());
            pstmt.setString(4, memo.getMemo());
            pstmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void updateMemo(MemoDTO memo) {
        String sql = "UPDATE calendar_memo SET memo = ? WHERE id = ?";
        try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setString(1, memo.getMemo());
            pstmt.setInt(2, memo.getId());
            pstmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void deleteMemo(int id) {
        String sql = "DELETE FROM calendar_memo WHERE id = ?";
        try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public List<MemoDTO> getMemosByMonth(int year, int month) {
        List<MemoDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM calendar_memo WHERE year = ? AND month = ?";
        try (Connection conn = ds.getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
            pstmt.setInt(1, year);
            pstmt.setInt(2, month);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                MemoDTO memo = new MemoDTO();
                memo.setId(rs.getInt("id"));
                memo.setYear(rs.getInt("year"));
                memo.setMonth(rs.getInt("month"));
                memo.setDay(rs.getInt("day"));
                memo.setMemo(rs.getString("memo"));
                list.add(memo);
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
}
