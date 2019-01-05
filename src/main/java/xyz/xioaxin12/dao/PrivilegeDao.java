package xyz.xioaxin12.dao;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ColumnListHandler;
import xyz.xioaxin12.utils.DataSourceUtils;

import java.sql.SQLException;
import java.util.List;

public class PrivilegeDao {

	// role 角色名称
	// pname 权限名称
	public boolean checkPrivilege(String role, String pname) {
		String sql = "SELECT privileges.name FROM PRIVILEGES,role,userprivilege WHERE privileges.id=userprivilege.privilege_id AND role.role=userprivilege.role AND role.role=?";
		QueryRunner runner = new QueryRunner(DataSourceUtils.getDataSource());
		List<Object> pnames = null;
		try {
			 pnames = runner.query(sql,new ColumnListHandler<>(),role);
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		System.out.println("当前用户角色是:" + role + "  需要的权限是:" + pname);
		System.out.println("当前角色具有的权限是:" + pnames);
		return (pnames.contains(pname));
	}
}
