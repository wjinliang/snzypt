package com.dm.atform.sqldao;

import com.dm.atform.model.AtTable;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * 数据库访问
 *
 * @author ASUS - Luotuan
 * @version v1.0
 * @date 2021/10/11
 * @since v1.0
 */
@Repository
public interface GlobalSearchMapper {
    /**
     * 全局搜索
     * @param param 参数
     * @return 结果集
     */
    @Select({"select id, pid, grid_name as gridName, info, origin from at_table_config where grid_name like concat('%',#{param,jdbcType=VARCHAR},'%') ESCAPE '/'"})
    List<AtTable> globalSearch(@Param("param") String param);
}
