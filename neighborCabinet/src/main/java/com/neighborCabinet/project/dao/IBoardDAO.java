package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.NboardVO;
import com.neighborCabinet.project.model.boardCommentVO;

import java.util.List;

public interface IBoardDAO {

    // 보드 리스트 가져오기
    List<NboardVO> boardList(int startBoardNum, int boardCountInPage);
    // Board Total Count - Board에 작성된 글 총 갯수 구하기
    int boardTotalCount();

    List<NboardVO> boardList2(int startBoardNum, int boardCountInPage);
    // Board Total Count - Board에 작성된 글 총 갯수 구하기
    int boardTotalCount2();

    int boardRegister(NboardVO nboardVO);

    NboardVO boardDetail(int boNo);

    public void boardDelete(int boNo);

    //댓글조회
    public List<boardCommentVO> list(int boNo);

    //댓글작성
    public void write(boardCommentVO vo);

    int commentTotalCount(int boNo);



}
