package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.FileVO;

import java.util.List;

public interface IFileDAO {
    // 특정 글에 해당하는 File List 가져오기
    List<FileVO> fileList(int pId) ;

    // 특정 글에 연관된 파일 리스트 저장
    int fileRegister(List<FileVO> fileList) ;

    // 특정 파일 가져오기
    FileVO fileDetail(int fileNo) ;

    // 파일 목록 삭제
    void fileDelete(List<FileVO> fileList) ;

    // 단독으로 첨부된 이미지 파일 리스트 가져오기
    List<String> imgFileList() ;
}


