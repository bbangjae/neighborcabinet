package com.neighborCabinet.project.controller;

import com.neighborCabinet.project.model.*;
import com.neighborCabinet.project.service.FileService;
import com.neighborCabinet.project.service.PlaceInfoService;
import com.neighborCabinet.project.service.RentalregService;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.util.ArrayList;
import java.util.List;


@Controller
public class rentalController_S {

    @Autowired
    RentalregService service;
    @Autowired
    FileService fileService;

    @Value("${file.upload.path}")
    String uploadPath;

    @RequestMapping("/rental/rentalreg/{sid}")
    public String rental(@PathVariable String sid, HttpSession httpSession, Model model) {
/*
        String loginId = (String) httpSession.getAttribute("sid");
        if(loginId == null){
            return "member/loginform";
        }
*/
        model.addAttribute("boxlist",service.boxreg(sid));

        return "rental/rentalreg";
    }


    @RequestMapping(value = "/rental/reg")
    private String reg(PlaceInfoVO placeInfo, HttpSession httpSession,HttpServletRequest req, MultipartFile[] files, Model model)throws Exception {

        // 글저장
/*
        PlaceInfoVO placeInfo = new PlaceInfoVO();
        placeInfo.setpWriteTitle(req.getParameter("pWriteTitle"));
        placeInfo.setpWriteSub(req.getParameter("pWriteSub"));
        placeInfo.setpType(req.getParameter("pType"));
        placeInfo.setpType_d(req.getParameter("pType_d"));
        placeInfo.setFood(req.getParameter("food"));
        placeInfo.setPickup(req.getParameter("pickup"));
        placeInfo.setpPlaceTitle(req.getParameter("pPlaceTitle"));
        placeInfo.setpPlaceInfo(req.getParameter("pPlaceInfo"));
        placeInfo.setpHp(req.getParameter("pHp"));
        placeInfo.setpTime(req.getParameter("pTime"));
        placeInfo.setpAddress1(req.getParameter("pAddress1"));
        placeInfo.setpAddress2(req.getParameter("pAddress2"));
        placeInfo.setpBoxInfo(req.getParameter("pBoxInfo"));
        placeInfo.setpCautionInfo(req.getParameter("pCautionInfo"));
*/
        placeInfo.setUserId((String)httpSession.getAttribute("sid"));
        service.rentalreg(placeInfo); // db에 글 저장

/*
        int boxQtyin = Integer.parseInt(req.getParameter("boxQty"));
*/


        //파일 저장소 위치 존재 확인 후 없으면 생성
        File folder = new File(System.getProperty("user.dir")+ uploadPath);
        if (!folder.exists()) {
            folder.mkdir();
        }

        // 파일을 저장하고, 저장된 파일 목록을 생성
        List<FileVO> fileList = new ArrayList<FileVO>();
        for(int a=0; a<files.length; a++) {
            // 첨부 파일 유무 확인 후, 있으면 파일 저장
            if( files[a].isEmpty())
                continue;
            String originalFileName = files[a].getOriginalFilename(); //파일의 원래 이름
            String uploadedFileName = RandomStringUtils.randomAlphanumeric(10)+"_"+originalFileName; // 중복 방지를 위해 저장될 랜덤값 + 파일 이름
            File fileToUpload = new File( System.getProperty("user.dir")+ uploadPath+ uploadedFileName );
            files[a].transferTo(fileToUpload);

            // 저장된 파일의 정보를 리스트로 보관
            FileVO fileInfo = new FileVO();
            fileInfo.setpId(placeInfo.getpNo());
            fileInfo.setOriginalFileName(originalFileName);
            fileInfo.setSavedFileName(uploadedFileName);
            fileList.add(fileInfo);
        }

        // 저장된 파일 정보 리스트를 DB에 저장
        if(fileList.size()>0) {
            fileService.fileRegister(fileList);
        }

        return "redirect:/place/placeDetailView/"+placeInfo.getpNo();
    }

    //이미지 출력
    @RequestMapping(value="/files/{fileNo}/download", method= RequestMethod.GET)
    private String fileDownload(HttpServletRequest req, HttpServletResponse res, @PathVariable int fileNo, Model model) throws Exception {

        try{
            FileVO fileInfo = fileService.fileDetail(fileNo);

            String saveFolderPath = System.getProperty("user.dir")+ uploadPath; // 파일이 저장된 위치
            String savedFileName = fileInfo.getSavedFileName(); // 서버에 저장된 이름
            String originalFileName = fileInfo.getOriginalFileName(); // 실제 내보낼 파일 명

            InputStream in = null;
            OutputStream os = null;
            File file = null;
            boolean skip = false;
            String client = "";

            //파일을 읽어 스트림에 담기
            try{
                file = new File(saveFolderPath, savedFileName);
                in = new FileInputStream(file);
            } catch (FileNotFoundException fe) {
                skip = true;
            }

            client = req.getHeader("User-Agent");

            //파일 다운로드 헤더 지정
            res.reset();
            res.setContentType("application/octet-stream");
            res.setHeader("Content-Description", "JSP Generated Data");

            if (!skip) {
                // IE
                if (client.indexOf("MSIE") != -1) {
                    res.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(originalFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                    // IE 11 이상.
                } else if (client.indexOf("Trident") != -1) {
                    res.setHeader("Content-Disposition", "attachment; filename=\""
                            + java.net.URLEncoder.encode(originalFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
                } else {
                    // 한글 파일명 처리
                    res.setHeader("Content-Disposition",
                            "attachment; filename=\"" + new String(originalFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
                    res.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
                }
                res.setHeader("Content-Length", "" + file.length());
                os = res.getOutputStream();
                byte b[] = new byte[(int) file.length()];
                int leng = 0;
                while ((leng = in.read(b)) > 0) {
                    os.write(b, 0, leng);
                }
            } else {
                res.setContentType("text/html;charset=UTF-8");
                System.out.println("<script language='javascript'>alert('파일을 찾을 수 없습니다');history.back();</script>");
            }
            in.close();
            os.close();
        } catch (Exception e) {
            System.out.println(e.toString());
            System.out.println("ERROR : " + e.getMessage());
        }

        return "place_b/placeDetailView";
    }

}
