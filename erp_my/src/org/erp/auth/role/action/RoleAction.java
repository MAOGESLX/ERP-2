package org.erp.auth.role.action;

import java.util.List;
import java.util.Set;

import org.erp.auth.menu.entity.MenuModel;
import org.erp.auth.resource.entity.ResourceModel;
import org.erp.auth.role.entity.RoleModel;
import org.erp.auth.role.entity.RoleQueryModel;
import org.erp.util.base.BaseAction;

public class RoleAction extends BaseAction<RoleModel> {
	public RoleQueryModel rhq = new RoleQueryModel();
	public Long[] resourUuids;
	public Long[] menuUuids;
	public String list()
	{
		list = roleServ.findAll(rhq, currPage, pageSize);
		rows = roleServ.rowCount(rhq);
		totalPage = rows%pageSize ==0 ? rows/pageSize : rows/pageSize+1;
		return LIST;
	}
	public String save()
	{
		if(model.getUuid() == null)
		{
			roleServ.save(model,resourUuids,menuUuids);
		}
		else
		{
			roleServ.update(model,resourUuids,menuUuids);
		}
		return TO_LIST;
	}
	public String input()
	{
		
		if(model.getUuid() != null)
		{
			model = roleServ.findById(model.getUuid());
			Set<ResourceModel> rs = model.getResources();
			resourUuids = new Long[rs.size()];
			int i = 0;
			for(ResourceModel rm : rs)
			{
				resourUuids[i++] = rm.getUuid();
			}
			Set<MenuModel> mms = model.getMenus();
			menuUuids = new Long[mms.size()];
			i = 0;
			for (MenuModel mm : mms) {
				menuUuids[i++] = mm.getUuid();
			}
			
		}
		List<MenuModel> menuList = menuServ.findAll();
		put("menuList", menuList);
		List<ResourceModel> res = resourceServ.findAll();
		put("resources", res);
		
		return INPUTUI;
	}
	public String delete()
	{
		roleServ.delete(model);
		return TO_LIST;
	}
}
