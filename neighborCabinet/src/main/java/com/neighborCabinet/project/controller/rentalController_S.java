package com.neighborCabinet.project.controller;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.rentalregVO;
import com.neighborCabinet.project.service.RentalregService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;


@Controller
public class rentalController_S {

    @Autowired
    RentalregService service;
/*
    FileService fileService;
*/

/*
    @Value("${file.upload.path}")
    String uploadPath;
*/

    @RequestMapping("/rental/rentalreg")
    public String rental() {
        return "rental/rentalreg";
    }
    @RequestMapping("/rental/reg")
    public String reg(PlaceInfoVO PlaceInfo , MultipartFile[] files) throws Exception{

        // 글저장
        service.rentalreg(PlaceInfo); // db에 글 저장

/*
        File folder = new File(System.getProperty("user.dir")+ uploadPath);
        if (!folder.exists()) {
            folder.mkdir();
        }

        //2. 먼저 파일을 저장하고, 저장된 파일 목록을 생성
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
            fileInfo.setFileNo(vo.getSpaceNo());
            fileInfo.setOriginalFileName(originalFileName);
            fileInfo.setSavedFileName(uploadedFileName);
            fileList.add(fileInfo);
        }

        //3. 저장된 파일 정보 리스트를 DB에 저장
        if(fileList.size()>0) {
            fileService.fileRegister(fileList);
        }*/

        return "redirect:/map";
    }

}
