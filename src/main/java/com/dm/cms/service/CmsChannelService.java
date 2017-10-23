package com.dm.cms.service;

import com.dm.cms.model.CmsChannel;
import com.dm.platform.dto.TreeNode;
import com.github.pagehelper.PageInfo;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by cgj on 2015/11/23.
 */
public interface CmsChannelService {
    void insertCmsChannel(CmsChannel cmsChannel);

    int updateCmsChannel(CmsChannel cmsChannel, boolean b);

    void deleteCmsChannel(int cmsChannelId);

    CmsChannel findOneById(int cmsChannelId);

    /**
     * 根据唯一英文简写查找频道
     *
     * @param enName
     * @return
     */
    CmsChannel findOneByEnName(String enName);

    CmsChannel findOneByPortal(String domain, String enName);

    PageInfo<CmsChannel> findCmsChannelByPage(Integer pageNum, Integer pageSize,
        CmsChannel cmsChannel);

    /**
     * 根据站点id获取频道树list
     *
     * @param siteId
     * @param channelType null时 查询所有
     * @param isfilter  是否过滤    在内容管理页面, 像url链接频道,单页频道 是需要过滤掉的 具体类型写死在sql
     * @return
     */
    List<TreeNode> findCmsChannelTreeNodeBySiteId(int siteId, String channelType, String isfilter);

    /**
     * 包含站点节点的频道树
     *
     * @return
     */
    List<TreeNode> findCmsChannelTreeNodeWithSiteNode();

    /**
     * 用户权限下包含站点节点的频道树
     *
     * @return
     */
    List<TreeNode> findCmsChannelTreeNodeWithSiteNodeFilterByUser();

    void updateSortOfCmsChannel(int fromCmsChannelId, int toCmsChannelId);
	Object sort(Integer id, Integer targetId, Integer pid, String moveType);

    /**
     * @descirption 根据站点或频道Id获取子频道，
     * <li>站点读取一级频道</li>
     * <li>一级频道读取二级频道</li>
     * @param argMap
     * @return
     */
	List<CmsChannel> findByRoot(Map argMap);

	boolean generateHtml(HttpServletRequest request, int channelId);

	boolean cancelGeneratorHtml(Integer channelId, HttpServletRequest request);

	List<Integer> selectChildChannelIdList(Integer channelId);

	List<CmsChannel> findAllByRoot(String channelType);

}
