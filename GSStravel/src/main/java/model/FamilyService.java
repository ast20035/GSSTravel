package model;

import java.sql.Date;
import java.util.List;

public class FamilyService {
	private IFamilyDAO familyDAO=new FamilyDAO();
	public List<FamilyVO> selectFam(String emp_No,long tra_No){
		return familyDAO.selectFam(emp_No,tra_No);
	}
	//親屬新增方法
	public void insert(FamilyVO famvo){
		familyDAO.insert(famvo);
	}
	//親屬更新方法
	public void update(FamilyVO famvo){
		familyDAO.update(famvo);
	}
	//親屬刪除方法
	public void delete(String famid){
		familyDAO.delete(famid);
	}
	//使用親屬
	public List<String> selectid(Integer empno){
		return familyDAO.selectid(empno);
	} 
	//使用 親屬編號來尋找親屬姓名
	public int select_byname(int emp_No ,String fam_Name){
		return familyDAO.select_byname(emp_No,fam_Name);
	}
	public Integer selectfam_No(String fam_Name){
		return familyDAO.selectfam_No(fam_Name);
	}
	public boolean insert_fam(FamilyVO famvo){
		return familyDAO.insert_fam(famvo);
	}
	
	public Integer selectfam_byid(String famid){
		return familyDAO.selectfam_byid(famid);
	}
	//用親屬編號來刪除親屬資料
	public List<Date> selectfam_Nodelete(int famno){
		return familyDAO.selectfam_Nodelete(famno);
	}
	//更新親屬的多選值(幼兒)
	public void updatefambab(Integer famno,Boolean fambab){
		familyDAO.updatefambab(famno,fambab);
	}
	//更新親屬的多選值(兒童)
	public void updatefamkid(Integer famno,Boolean famkid){
		familyDAO.updatefamkid(famno,famkid);
	}
	//更新親屬的多選值(領殘障手冊)
	public void updatefamdis(Integer famno,Boolean famdis){
		familyDAO.updatefamdis(famno,famdis);
	}
	//更新親屬的多選值(孕婦)
	public void updatefammom(Integer famno,Boolean fammom){
		familyDAO.updatefammom(famno,fammom);
	}
}
