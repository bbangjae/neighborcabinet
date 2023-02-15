package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.NboardVO;

import java.util.List;

public interface IBoardService {
    List<NboardVO> boardList(int startBoardNum, int boardCountInPage);
    int boardTotalCount();

    List<NboardVO> boardList2(int startBoardNum, int boardCountInPage);
    // Board Total Count - Board에 작성된 글 총 갯수 구하기
    int boardTotalCount2();

    int boardRegister(NboardVO nboardVO);

    NboardVO boardDetail(int boNo);

    public void boardDelete(int boNo);



}
