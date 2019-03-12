package com.yi.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.apache.commons.io.IOUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.CellValue;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xssf.usermodel.extensions.XSSFCellAlignment;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.yi.domain.Criteria;
import com.yi.domain.PageMaker;
import com.yi.domain.QuestionVO;
import com.yi.service.QuestionService;
import com.yi.util.MediaUtils;

@Controller
@RequestMapping("/question/*")
public class QuestionController {

	private static final Logger logger = LoggerFactory.getLogger(QuestionController.class);

	@Autowired
	private QuestionService service;
	@Autowired
	private DataSource ds;
	// 기본형은 주입받으려면 servlet-context에 등록된 이름으로 주입
	@Resource(name = "uploadPath")
	private String uploadPath;

	@RequestMapping(value = "register", method = RequestMethod.GET)
	public void registerGet() {
		logger.info("QuestionVO create------------GET");
	}

	// 문제추가
	@RequestMapping(value = "register", method = RequestMethod.POST)
	public String registerPost(QuestionVO vo, String number, MultipartFile pictureFile) {
		logger.info("QuestionVO create------------POST");
		// 정답률, 상태는 입력없이 기본 0값/정상처리
		vo.setState("정상");
		vo.setCorrectRate(0);
		// 사진파일 경로 저장
		String picture = pictureFile.getOriginalFilename();
		if (picture.equals("") == false) {
			System.out.println("=============pictureFile.getOriginalFilename()" + picture);
			vo.setPicture(uploadPath + "/" + picture);
			logger.info("QuestionVO create------------" + vo);
		}
		// 연도/회차/번호를 이용하여 Code입력하기
		String threeNum = String.format("%03d", Integer.parseInt(number));
		System.out.println("Q" + vo.getSubject() + vo.getYear() + vo.getRound() + threeNum);
		vo.setQuestionCode("Q" + vo.getSubject() + vo.getYear() + vo.getRound() + threeNum);
		// insert수행
		service.insert(vo);
		System.out.println(vo);

		return "redirect:/question/register";
	}

	// 문제추가
	@RequestMapping(value = "registerfile", method = RequestMethod.GET)
	public void registerfileGet() {
		logger.info("registerfileGet------------GET");
	}

	// 문제추가 파일 업로드, upload파일에 파일먼저 올린 후 올린파일로 insert 수행, 이후 파일 삭제
	@RequestMapping(value = "registerfile", method = RequestMethod.POST)
	public void registerfilePost(MultipartFile file, HttpServletRequest req) throws IOException {
		logger.info("registerfilePost------------Post");
		logger.info("registerfilePost------------filePath-" + file.getOriginalFilename());// 파일 받아옴
		// 파일 upload폴더에 저장
		String uploadPath2 = req.getRealPath("resources/upload");// 파일이 저장될 upload폴더의 경로
		logger.info("req.getRealPath(upload)------------" + uploadPath2);

		File dir = new File(uploadPath2);
		if (dir.exists() == false) {// 업로드 폴더가 없을때 만들어지도록(완료)
			dir.mkdirs();
		}

		// 파일 복사 후 저장
		InputStream inStream = null;
		OutputStream outStream = null;

		try {
			inStream = file.getInputStream(); // 원본파일
			logger.info("file.getOriginalFilename()------------" + file.getInputStream());
			outStream = new FileOutputStream(uploadPath2 + "/" + file.getOriginalFilename()); // 이동시킬 위치
			logger.info("uploadPath2+file.getOriginalFilename()------------" + uploadPath2 + file);

			byte[] buffer = new byte[1024];
			int length;

			while ((length = inStream.read(buffer)) > 0) {
				outStream.write(buffer, 0, length);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			outStream.close();
		}

		// LOAD DATA를 이용한 insert부분
		/*
		 * try (Connection con = ds.getConnection(); Statement stmt =
		 * con.createStatement()) { String tableName = "question"; //String filePath =
		 * "C:/ProgramData/MySQL/MySQL Server 5.7/Uploads/question201901_5.csv"; String
		 * sql = String.format("LOAD DATA LOCAL INFILE '%s' IGNORE INTO TABLE %s " +
		 * "character set 'UTF8' " + "fields TERMINATED by ',' ENCLOSED BY '\"' " +
		 * "LINES TERMINATED BY '\\r\\n' " + "IGNORE 1 lines " +
		 * "(question_code, question_title, choice1, choice2, choice3, choice4, correct, state, correct_rate, picture,`year`,round, subject)"
		 * ,uploadPath2+file.getOriginalFilename(), "question");
		 * 
		 * stmt.executeQuery(sql); System.out.println(sql);
		 * 
		 * } catch (SQLException e) { e.printStackTrace(); }
		 */

		// poi 라이브러리를 이용
		List<QuestionVO> list = new ArrayList<>();

		FileInputStream fis = null;
		XSSFWorkbook workbook = null;

		try {
			fis = new FileInputStream(uploadPath2 + "\\" + file.getOriginalFilename());
			logger.info("====uploadPath2+file.getOriginalFilename()------------" + uploadPath2 + "\\"
					+ file.getOriginalFilename());
			workbook = new XSSFWorkbook(fis);

			// 탐색에 사용할 Sheet, Row, Cell 객체
			XSSFSheet curSheet;
			XSSFRow curRow;
			XSSFCell curCell;
			QuestionVO vo;

			// Sheet 탐색 for문
			for (int sheetIndex = 0; sheetIndex < workbook.getNumberOfSheets(); sheetIndex++) {
				// 현재 Sheet 반환
				curSheet = workbook.getSheetAt(sheetIndex);
				// row 탐색 for문
				for (int rowIndex = 0; rowIndex < curSheet.getPhysicalNumberOfRows(); rowIndex++) {
					// row 0은 헤더정보이기 때문에 무시
					if (rowIndex != 0) {
						// 현재 row 반환
						curRow = curSheet.getRow(rowIndex);
						vo = new QuestionVO();

						// row의 첫번째 cell값이 비어있지 않은 경우 만 cell탐색
						if (!"".equals(curRow.getCell(0).getStringCellValue())) {
							// cell 탐색 for 문
							for (int cellIndex = 0; cellIndex < curRow.getPhysicalNumberOfCells()+1; cellIndex++) {
								curCell = curRow.getCell(cellIndex);

								switch (cellIndex) {
								case 0: // 문제코드
									vo.setQuestionCode(getCellValue(curCell));
									break;
								case 1: // title
									vo.setQuestionTitle(getCellValue(curCell));
									break;
								case 2: // 보기1
									vo.setChoice1(getCellValue(curCell));
									break;
								case 3: // 보기2
									vo.setChoice2(getCellValue(curCell));
									break;
								case 4: // 보기3
									vo.setChoice3(getCellValue(curCell));
									break;
								case 5: // 보기4
									vo.setChoice4(getCellValue(curCell));
									break;
								case 6: // 정답
									vo.setCorrect(Integer.parseInt(getCellValue(curCell).substring(0, 1)));
									break;
								case 7: // 상태
									vo.setState(getCellValue(curCell));
									break;
								case 8: // 정답률
									vo.setCorrectRate(Integer.parseInt(getCellValue(curCell).substring(0, 1)));
									break;
								case 9: // 사진
									vo.setPicture(getCellValue(curCell));
									break;
								case 10: // 연도
									vo.setYear(Integer.parseInt(getCellValue(curCell).substring(0, 4)));
									break;
								case 11: // 회차
									vo.setRound(Integer.parseInt(getCellValue(curCell).substring(0, 1)));
									break;
								case 12: // 과목
									vo.setSubject(getCellValue(curCell));
									break;
								default:
									break;
								}

							}
							// cell 탐색 이후 vo 추가
							list.add(vo);
						}
					}
				}

			}
			logger.info("엑셀파일로 읽어드린 list------------" + list);
			// list를 insert하기
			for(int i=0;i<list.size();i++) {
				service.insert(list.get(i));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		// insert완료 후 upload폴더에 복사됐던 파일 삭제
		File delFile = new File(uploadPath2 + "/" + file.getOriginalFilename());
		delFile.delete();
	}

	private String getCellValue(XSSFCell cell) {
		logger.info("---value -------------" + cell);
		String value;
		try {
			value = cell.toString();
		}catch(NullPointerException e) {
			value = "";
		}
		return value;
	}
	
	// jsp로 가는 메소드
	@RequestMapping(value = "moketest", method = RequestMethod.GET)
	public void moketest(Criteria cri, Model model) {
		System.out.println("cri===========:" + cri);
		List<QuestionVO> list = service.selectByYearAndRound(2018, 3, cri);/////// 연도와 회차 외부에서 받기!!!!

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount(2018, 3));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}

	// jsp로 가는 메소드
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void list(Criteria cri, Model model) {
		System.out.println("cri===========:" + cri);
		List<QuestionVO> list = service.selectByYearAndRound(2018, 3, cri);/////// 연도와 회차 외부에서 받기!!!!

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount(2018, 3));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}

	// 랜덤으로 한문제씩
	@RequestMapping(value = "singletest", method = RequestMethod.GET)
	public void singleTest(Criteria cri, Model model) {
		System.out.println("cri===========:" + cri);
		cri.setPerPageNum(1);
		List<QuestionVO> list = service.selectByRandom();
		model.addAttribute("list", list);
		model.addAttribute("cri", cri);
	}

	// 과목별 문제 : 라디오선택 시 바로 insert되는 controller
	@RequestMapping(value = "subjecttest", method = RequestMethod.GET)
	public void subjecttest(Criteria cri, Model model) {
		logger.info("subjecttest get------------");
		List<QuestionVO> list = service.selectBySubject("D");// 외부에서 값 받기!

		PageMaker pageMaker = new PageMaker();
		cri.setPerPageNum(1);
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.totalCount(2018, 3));

		model.addAttribute("list", list);
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("cri", cri);
	}

	// json을 보내는 메소드 - list.jsp에서 사용
	@ResponseBody
	@RequestMapping(value = "listJson/{year}/{round}", method = RequestMethod.GET)
	public ResponseEntity<List<QuestionVO>> listJson(Criteria cri, @PathVariable("year") int year,
			@PathVariable("round") int round) {
		ResponseEntity<List<QuestionVO>> entity = null;

		try {
			List<QuestionVO> list = service.selectByYearAndRound(year, round, cri);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);// List<QuestionVO>로 보내야 하나, 보낼수없을때는HttpStatus만 보냄
		}

		return entity;
	}

	// page를 ajax로 처리하는 list
	@ResponseBody
	@RequestMapping(value = "listJson/{year}/{round}/{page}", method = RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> listJsonPage(Criteria cri, @PathVariable("year") int year,
			@PathVariable("round") int round, @PathVariable("page") int page) {
		ResponseEntity<Map<String, Object>> entity = null;

		try {
			cri.setPage(page);
			List<QuestionVO> list = service.selectByYearAndRound(year, round, cri);
			// 페이지정보
			PageMaker pageMaker = new PageMaker();
			pageMaker.setCri(cri);
			// 리스트정보와 페이지정보를 같이 보내기위해 map에 저장
			HashMap<String, Object> map = new HashMap<>();
			map.put("list", list);
			map.put("pageMaker", pageMaker);
			entity = new ResponseEntity<>(map, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);// List<QuestionVO>로 보내야 하나, 보낼수없을때는HttpStatus만 보냄
		}

		return entity;
	}

	// json으로 과목별 문제select 보내는 메소드 - subjecttest.jsp에서 사용
	@ResponseBody
	@RequestMapping(value = "subjecttest/{subject}", method = RequestMethod.GET)
	public ResponseEntity<List<QuestionVO>> listBySubjectJson(@PathVariable("subject") String subject) {
		ResponseEntity<List<QuestionVO>> entity = null;

		try {
			List<QuestionVO> list = service.selectBySubject(subject);
			entity = new ResponseEntity<>(list, HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}

		return entity;
	}

	// 관리자가 문제 수정창으로 이동하는 용
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void updateget(String questionCode, Model model) {
		ResponseEntity<String> entity = null;
		QuestionVO vo = new QuestionVO();
		vo.setQuestionCode(questionCode);
		vo = service.selectByNO(vo);

		model.addAttribute("vo", vo);
	}

	@RequestMapping(value = "{questionCode}", method = RequestMethod.PUT)
	public ResponseEntity<String> update(@PathVariable("questionCode") String questionCode,
			@RequestBody QuestionVO vo) {
		ResponseEntity<String> entity = null;
		try {
			vo.setQuestionCode(questionCode);
			service.update(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@RequestMapping(value = "{questionCode}", method = RequestMethod.DELETE)
	public ResponseEntity<String> remove(@PathVariable("questionCode") String questionCode) {
		ResponseEntity<String> entity = null;

		try {
			QuestionVO vo = new QuestionVO();
			vo.setQuestionCode(questionCode);
			service.delete(vo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

	@ResponseBody
	@RequestMapping("/displayFile")
	public ResponseEntity<byte[]> displayFile(String filename, Model model) {
		ResponseEntity<byte[]> entity = null;
		logger.info("displayFile : " + filename);
		try {
			try {
				String format = filename.substring(filename.lastIndexOf(".") + 1);
				String picture = filename.substring(filename.lastIndexOf("/"));
				MediaType mType = MediaUtils.getMediaType(format);

				HttpHeaders headers = new HttpHeaders();
				InputStream in = null;
				in = new FileInputStream(uploadPath + "/" + picture);
				headers.setContentType(mType);

				entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
				in.close();
			} catch (StringIndexOutOfBoundsException e) {
				return null;
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}

}
