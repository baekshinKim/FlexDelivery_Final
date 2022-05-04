package com.project.fd.common;

import java.text.SimpleDateFormat;
import java.util.List;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.streaming.SXSSFSheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.springframework.stereotype.Service;

import com.project.fd.admin.stores.model.AdminStoresVO;
import com.project.fd.admin.temporary.model.AdminTemporaryVO;

@Service
public class ExcelService {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 HH:mm:ss");

    /**
     * 리스트를 간단한 엑셀 워크북 객체로 생성
     * @param list
     * @return 생성된 워크북
     */
    public SXSSFWorkbook makeExcelApprovalList(List<AdminStoresVO> list) {
        SXSSFWorkbook workbook = new SXSSFWorkbook();
        
        // 시트 생성
        SXSSFSheet sheet = workbook.createSheet("점포 승인 목록");
        
        
        //시트 열 너비 설정
        sheet.setColumnWidth(0, 4000);//점포등록신청번호
        sheet.setColumnWidth(1, 7000);//점포등록신청일
        sheet.setColumnWidth(2, 4000);//사업자등록번호
        sheet.setColumnWidth(3, 4000);//점포주명
        sheet.setColumnWidth(4, 4000);//점포명
        sheet.setColumnWidth(5, 4000);//주소
        sheet.setColumnWidth(6, 8000);//세부주소
        sheet.setColumnWidth(7, 5000);//hp1
        sheet.setColumnWidth(8, 4000);//관리자승인플래그
        

        //Cell Style
        CellStyle mergeRowStyle1 = workbook.createCellStyle();
        mergeRowStyle1.setAlignment(HorizontalAlignment.CENTER);
        mergeRowStyle1.setVerticalAlignment(VerticalAlignment.CENTER);
        mergeRowStyle1.setBorderTop(BorderStyle.THICK);
        mergeRowStyle1.setBorderLeft(BorderStyle.MEDIUM_DASH_DOT_DOT);
        mergeRowStyle1.setFillForegroundColor(IndexedColors.AQUA.getIndex());
        mergeRowStyle1.setFillPattern(FillPatternType.BRICKS);
        
        XSSFCellStyle mergeRowStyle2 = (XSSFCellStyle) workbook.createCellStyle();
        mergeRowStyle2.setAlignment(HorizontalAlignment.CENTER);
        mergeRowStyle2.setVerticalAlignment(VerticalAlignment.TOP);
        mergeRowStyle2.setBorderTop(BorderStyle.THIN);
        mergeRowStyle2.setBorderLeft(BorderStyle.DOTTED);
        mergeRowStyle2.setBorderBottom(BorderStyle.SLANTED_DASH_DOT);
        mergeRowStyle2.setBorderRight(BorderStyle.HAIR);
        mergeRowStyle2.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 192,(byte) 192,(byte) 192}, null));
        mergeRowStyle2.setFillPattern(FillPatternType.FINE_DOTS);
        
        Font headerFont = workbook.createFont();
        headerFont.setFontName("나눔고딕");
        headerFont.setColor(IndexedColors.GREEN.getIndex());
        headerFont.setBold(true);
        
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setVerticalAlignment(VerticalAlignment.BOTTOM);
        headerStyle.setBorderTop(BorderStyle.MEDIUM);
        headerStyle.setBorderLeft(BorderStyle.MEDIUM);
        headerStyle.setBorderBottom(BorderStyle.MEDIUM);
        headerStyle.setBorderRight(BorderStyle.MEDIUM);
        headerStyle.setFont(headerFont);
        
        
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setAlignment(HorizontalAlignment.CENTER);
        bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        bodyStyle.setBorderTop(BorderStyle.THIN);
        bodyStyle.setBorderBottom(BorderStyle.THIN);
        bodyStyle.setBorderLeft(BorderStyle.THIN);
        bodyStyle.setBorderRight(BorderStyle.THIN);
        
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
        // 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("신청번호");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("신청일");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 세번째 열 셀 생성
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("사업자등록번호");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("대표명");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 다섯번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("점포명");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 여섯번째 열 셀 생성
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("주소");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 일곱번째 열 셀 생성
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("세부주소");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 여덞번째 열 셀 생성
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("점포주연락처");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 아홉번째 열 셀 생성
        headerCell = headerRow.createCell(8);
        headerCell.setCellValue("승인플래그");
        headerCell.setCellStyle(headerStyle);
        
        // 표 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
           AdminStoresVO vo = list.get(i);
           
           	bodyRow = sheet.createRow(i+1);
           	
           	// 해당 행의 첫번째 열 셀 생성
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(vo.getStoreNo());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 두번째 열 셀 생성
            bodyCell = bodyRow.createCell(1);
            bodyCell.setCellValue(sdf.format(vo.getStoreRegdate()));
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 세번째 열 셀 생성
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(vo.getoRegisterNo());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 네번째 열 셀 생성
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(vo.getOwnerName());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 다섯번째 열 셀 생성
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(vo.getStoreName());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 여섯번째 열 셀 생성
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(vo.getStoreAddress());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 일곱번째 열 셀 생성
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(vo.getStoreAddressDetail());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 여덞번째 열 셀 생성
            String ownerHp ="";
            ownerHp = vo.getOwnerHp1() +"-"+vo.getOwnerHp2()+"-"+vo.getOwnerHp3();
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(ownerHp);
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 아홉번째 열 셀 생성
            bodyCell = bodyRow.createCell(8);
            bodyCell.setCellValue(flagToString(vo.getaAgreeNo()));//관리승인번호를 문자열로 변환해서 저장
            bodyCell.setCellStyle(bodyStyle);
        }//for
        
        return workbook;
    }
    
    public SXSSFWorkbook makeExcelEditList(List<AdminTemporaryVO> list) {
        SXSSFWorkbook workbook = new SXSSFWorkbook();
        
        // 시트 생성
        SXSSFSheet sheet = workbook.createSheet("점포 변경 목록");
        
        
        //시트 열 너비 설정
        sheet.setColumnWidth(0, 4000);//점포등록신청번호
        sheet.setColumnWidth(1, 7000);//점포등록신청일
        sheet.setColumnWidth(2, 4000);//사업자등록번호
        sheet.setColumnWidth(3, 4000);//점포주명
        sheet.setColumnWidth(4, 4000);//점포명
        sheet.setColumnWidth(5, 4000);//주소
        sheet.setColumnWidth(6, 8000);//세부주소
        sheet.setColumnWidth(7, 5000);//점포주연락처
        sheet.setColumnWidth(8, 4000);//관리자승인플래그
        

        //Cell Style
        CellStyle mergeRowStyle1 = workbook.createCellStyle();
        mergeRowStyle1.setAlignment(HorizontalAlignment.CENTER);
        mergeRowStyle1.setVerticalAlignment(VerticalAlignment.CENTER);
        mergeRowStyle1.setBorderTop(BorderStyle.THICK);
        mergeRowStyle1.setBorderLeft(BorderStyle.MEDIUM_DASH_DOT_DOT);
        mergeRowStyle1.setFillForegroundColor(IndexedColors.AQUA.getIndex());
        mergeRowStyle1.setFillPattern(FillPatternType.BRICKS);
        
        XSSFCellStyle mergeRowStyle2 = (XSSFCellStyle) workbook.createCellStyle();
        mergeRowStyle2.setAlignment(HorizontalAlignment.CENTER);
        mergeRowStyle2.setVerticalAlignment(VerticalAlignment.TOP);
        mergeRowStyle2.setBorderTop(BorderStyle.THIN);
        mergeRowStyle2.setBorderLeft(BorderStyle.DOTTED);
        mergeRowStyle2.setBorderBottom(BorderStyle.SLANTED_DASH_DOT);
        mergeRowStyle2.setBorderRight(BorderStyle.HAIR);
        mergeRowStyle2.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 192,(byte) 192,(byte) 192}, null));
        mergeRowStyle2.setFillPattern(FillPatternType.FINE_DOTS);
        
        Font headerFont = workbook.createFont();
        headerFont.setFontName("나눔고딕");
        headerFont.setColor(IndexedColors.GREEN.getIndex());
        headerFont.setBold(true);
        
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setVerticalAlignment(VerticalAlignment.BOTTOM);
        headerStyle.setBorderTop(BorderStyle.MEDIUM);
        headerStyle.setBorderLeft(BorderStyle.MEDIUM);
        headerStyle.setBorderBottom(BorderStyle.MEDIUM);
        headerStyle.setBorderRight(BorderStyle.MEDIUM);
        headerStyle.setFont(headerFont);
        
        
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setAlignment(HorizontalAlignment.CENTER);
        bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        bodyStyle.setBorderTop(BorderStyle.THIN);
        bodyStyle.setBorderBottom(BorderStyle.THIN);
        bodyStyle.setBorderLeft(BorderStyle.THIN);
        bodyStyle.setBorderRight(BorderStyle.THIN);
        
        
        
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
      
        // 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("변경신청번호");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("변경신청일");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 세번째 열 셀 생성        
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("사업자등록번호");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("대표명");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 다섯번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("점포명");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 여섯번째 열 셀 생성
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("주소");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 일곱번째 열 셀 생성
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("세부주소");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 여덞번째 열 셀 생성
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("점포주연락처");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 아홉번째 열 셀 생성
        headerCell = headerRow.createCell(8);
        headerCell.setCellValue("승인플래그");
        headerCell.setCellStyle(headerStyle);
        
        // 표 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
           AdminTemporaryVO vo = list.get(i);
           
           	bodyRow = sheet.createRow(i+1);
           	
           	// 해당 행의 첫번째 열 셀 생성
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(vo.gettNo());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 두번째 열 셀 생성
            bodyCell = bodyRow.createCell(1);
            if(vo.gettSubmitdate() == null) {
            	bodyCell.setCellValue("");
            }else {
            	bodyCell.setCellValue(sdf.format(vo.gettSubmitdate()));            	
            }
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 세번째 열 셀 생성
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(vo.getoRegisterNo());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 네번째 열 셀 생성
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(vo.gettOwnerName());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 다섯번째 열 셀 생성
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(vo.gettStoresName());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 여섯번째 열 셀 생성
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(vo.gettStoresAddress());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 일곱번째 열 셀 생성
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(vo.gettStoresAddressDetail());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 여덞번째 열 셀 생성
            String ownerHp="";
            ownerHp = vo.gettOwnerHp1() + "-"+ vo.gettOwnerHp2() +"-" + vo.gettOwnerHp3();
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(ownerHp);
            bodyCell.setCellStyle(bodyStyle);
         // 해당 행의 아홉번째 열 셀 생성
            bodyCell = bodyRow.createCell(8);
            bodyCell.setCellValue(flagToString(vo.getaAgreeNo()));//관리승인번호를 문자열로 변환해서 저장
            bodyCell.setCellStyle(bodyStyle);
        }//for
        return workbook;
    }
    /*
    public SXSSFWorkbook makeExcelRegistList(List<AdminOwnerRegisterVo> list) {
        SXSSFWorkbook workbook = new SXSSFWorkbook();
        
        // 시트 생성
        SXSSFSheet sheet = workbook.createSheet("사업자등록 승인 목록");
        
        
        //시트 열 너비 설정
        sheet.setColumnWidth(0, 7000);//사업자등록증번호
        sheet.setColumnWidth(1, 4000);//대표자명
        sheet.setColumnWidth(2, 4000);//사업자등록번호
        sheet.setColumnWidth(3, 4000);//점포주명
        sheet.setColumnWidth(4, 4000);//점포명
        sheet.setColumnWidth(5, 4000);//주소
        sheet.setColumnWidth(6, 8000);//세부주소
        sheet.setColumnWidth(7, 5000);//점포주연락처
        sheet.setColumnWidth(8, 4000);//관리자승인플래그
        

        //Cell Style
        CellStyle mergeRowStyle1 = workbook.createCellStyle();
        mergeRowStyle1.setAlignment(HorizontalAlignment.CENTER);
        mergeRowStyle1.setVerticalAlignment(VerticalAlignment.CENTER);
        mergeRowStyle1.setBorderTop(BorderStyle.THICK);
        mergeRowStyle1.setBorderLeft(BorderStyle.MEDIUM_DASH_DOT_DOT);
        mergeRowStyle1.setFillForegroundColor(IndexedColors.AQUA.getIndex());
        mergeRowStyle1.setFillPattern(FillPatternType.BRICKS);
        
        XSSFCellStyle mergeRowStyle2 = (XSSFCellStyle) workbook.createCellStyle();
        mergeRowStyle2.setAlignment(HorizontalAlignment.CENTER);
        mergeRowStyle2.setVerticalAlignment(VerticalAlignment.TOP);
        mergeRowStyle2.setBorderTop(BorderStyle.THIN);
        mergeRowStyle2.setBorderLeft(BorderStyle.DOTTED);
        mergeRowStyle2.setBorderBottom(BorderStyle.SLANTED_DASH_DOT);
        mergeRowStyle2.setBorderRight(BorderStyle.HAIR);
        mergeRowStyle2.setFillForegroundColor(new XSSFColor(new byte[] {(byte) 192,(byte) 192,(byte) 192}, null));
        mergeRowStyle2.setFillPattern(FillPatternType.FINE_DOTS);
        
        Font headerFont = workbook.createFont();
        headerFont.setFontName("나눔고딕");
        headerFont.setColor(IndexedColors.GREEN.getIndex());
        headerFont.setBold(true);
        
        CellStyle headerStyle = workbook.createCellStyle();
        headerStyle.setAlignment(HorizontalAlignment.CENTER);
        headerStyle.setVerticalAlignment(VerticalAlignment.BOTTOM);
        headerStyle.setBorderTop(BorderStyle.MEDIUM);
        headerStyle.setBorderLeft(BorderStyle.MEDIUM);
        headerStyle.setBorderBottom(BorderStyle.MEDIUM);
        headerStyle.setBorderRight(BorderStyle.MEDIUM);
        headerStyle.setFont(headerFont);
        
        
        CellStyle bodyStyle = workbook.createCellStyle();
        bodyStyle.setAlignment(HorizontalAlignment.CENTER);
        bodyStyle.setVerticalAlignment(VerticalAlignment.CENTER);
        bodyStyle.setBorderTop(BorderStyle.THIN);
        bodyStyle.setBorderBottom(BorderStyle.THIN);
        bodyStyle.setBorderLeft(BorderStyle.THIN);
        bodyStyle.setBorderRight(BorderStyle.THIN);
        
        
        
        // 헤더 행 생
        Row headerRow = sheet.createRow(0);
      
        // 해당 행의 첫번째 열 셀 생성
        Cell headerCell = headerRow.createCell(0);
        headerCell.setCellValue("변경신청번호");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 두번째 열 셀 생성
        headerCell = headerRow.createCell(1);
        headerCell.setCellValue("변경신청일");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 세번째 열 셀 생성        
        headerCell = headerRow.createCell(2);
        headerCell.setCellValue("사업자등록번호");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 네번째 열 셀 생성
        headerCell = headerRow.createCell(3);
        headerCell.setCellValue("대표명");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 다섯번째 열 셀 생성
        headerCell = headerRow.createCell(4);
        headerCell.setCellValue("점포명");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 여섯번째 열 셀 생성
        headerCell = headerRow.createCell(5);
        headerCell.setCellValue("주소");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 일곱번째 열 셀 생성
        headerCell = headerRow.createCell(6);
        headerCell.setCellValue("세부주소");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 여덞번째 열 셀 생성
        headerCell = headerRow.createCell(7);
        headerCell.setCellValue("점포주연락처");
        headerCell.setCellStyle(headerStyle);
        // 해당 행의 아홉번째 열 셀 생성
        headerCell = headerRow.createCell(8);
        headerCell.setCellValue("승인플래그");
        headerCell.setCellStyle(headerStyle);
        
        // 표 내용 행 및 셀 생성
        Row bodyRow = null;
        Cell bodyCell = null;
        for(int i=0; i<list.size(); i++) {
           AdminTemporaryVO vo = list.get(i);
           
           	bodyRow = sheet.createRow(i+1);
           	
           	// 해당 행의 첫번째 열 셀 생성
            bodyCell = bodyRow.createCell(0);
            bodyCell.setCellValue(vo.gettNo());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 두번째 열 셀 생성
            bodyCell = bodyRow.createCell(1);
            if(vo.gettSubmitdate() == null) {
            	bodyCell.setCellValue("");
            }else {
            	bodyCell.setCellValue(sdf.format(vo.gettSubmitdate()));            	
            }
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 세번째 열 셀 생성
            bodyCell = bodyRow.createCell(2);
            bodyCell.setCellValue(vo.getoRegisterNo());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 네번째 열 셀 생성
            bodyCell = bodyRow.createCell(3);
            bodyCell.setCellValue(vo.gettOwnerName());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 다섯번째 열 셀 생성
            bodyCell = bodyRow.createCell(4);
            bodyCell.setCellValue(vo.gettStoresName());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 여섯번째 열 셀 생성
            bodyCell = bodyRow.createCell(5);
            bodyCell.setCellValue(vo.gettStoresAddress());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 일곱번째 열 셀 생성
            bodyCell = bodyRow.createCell(6);
            bodyCell.setCellValue(vo.gettStoresAddressDetail());
            bodyCell.setCellStyle(bodyStyle);
            // 해당 행의 여덞번째 열 셀 생성
            String ownerHp="";
            ownerHp = vo.gettOwnerHp1() + "-"+ vo.gettOwnerHp2() +"-" + vo.gettOwnerHp3();
            bodyCell = bodyRow.createCell(7);
            bodyCell.setCellValue(ownerHp);
            bodyCell.setCellStyle(bodyStyle);
         // 해당 행의 아홉번째 열 셀 생성
            bodyCell = bodyRow.createCell(8);
            bodyCell.setCellValue(flagToString(vo.getaAgreeNo()));//관리승인번호를 문자열로 변환해서 저장
            bodyCell.setCellStyle(bodyStyle);
        }//for
        return workbook;
    }*/
    
    public String flagToString(int flag) {
    	String result ="";
    	//관리승인번호를 문자열로 변환
    	switch(flag) {
    		case   1:	result="승인대기";
    					break;
    		case   2:	result="승인취소";
    					break;
    		case   3:	result="승인완료";
    					break;
    		case   4:	result="승인반려";
    					break;
    		case   5:	result="변경대기";
    					break;
    		case   6:	result="변경완료";
    					break;
    		case   7:	result="변경반려";
    					break;
    		case   8:	result="탈퇴신청";
    					break;
    		case   9:	result="탈퇴완료";
    					break;
    		default :	result="Invalid Value";    				
    	}
    	return result;    	
    }

    
    /**
     * 생성한 엑셀 워크북을 컨트롤레에서 받게해줄 메소드
     * @param list
     * @return
     */
    public SXSSFWorkbook approvalExcelDownloadProcess(List<AdminStoresVO> list) {
        return this.makeExcelApprovalList(list);
    }
    
    public SXSSFWorkbook editExcelDownloadProcess(List<AdminTemporaryVO> list) {
        return this.makeExcelEditList(list);
    }
    /*
	public SXSSFWorkbook registExcelDownloadProcess(List<AdminOwnerRegisterVo> list) {
		return this.makeExcelRegistList(list);
	}
	*/
}
