package com.project.fd.owner.menu.model;

import com.project.fd.admin.mediumcategory.model.AdminMediumCategoryViewVO;

public class OwnerMainMenuAllVO {
	

		private OwnerMenuVO menuVo;
		
		
		private AdminMediumCategoryViewVO aMCategoryVo;


		public OwnerMenuVO getMenuVo() {
			return menuVo;
		}


		public void setMenuVo(OwnerMenuVO menuVo) {
			this.menuVo = menuVo;
		}


		public AdminMediumCategoryViewVO getaMCategoryVo() {
			return aMCategoryVo;
		}


		public void setaMCategoryVo(AdminMediumCategoryViewVO aMCategoryVo) {
			this.aMCategoryVo = aMCategoryVo;
		}


		@Override
		public String toString() {
			return "OwnerMainMenuAllVO [menuVo=" + menuVo + ", aMCategoryVo=" + aMCategoryVo + "]";
		}
		
		
		
	
	
	
}
