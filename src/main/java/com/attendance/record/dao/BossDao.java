package com.attendance.record.dao;

import com.attendance.record.domain.Boss;
import org.springframework.stereotype.Repository;

@Repository
public interface BossDao {
    Boss selectBossByBossNum(String bossNum);
}
