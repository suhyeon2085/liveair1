package org.zerock.persistence;

import java.util.List;
import org.zerock.domain.MemoDTO;

public interface MemoDAO {
    void insertMemo(MemoDTO memo);
    void updateMemo(MemoDTO memo);
    void deleteMemo(int id);
    List<MemoDTO> getMemosByMonth(int year, int month);
}
