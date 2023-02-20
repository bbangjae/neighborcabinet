package com.neighborCabinet.project.service;

import com.neighborCabinet.project.dao.IBoardDAO;
import com.neighborCabinet.project.model.NboardVO;
import com.neighborCabinet.project.model.boardCommentVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BoardService implements IBoardService{

    @Autowired
    @Qualifier("IBoardDAO")
    IBoardDAO dao;


    @Override
    public List<NboardVO> boardList(int startBoardNum, int boardCountInPage) {
        return dao.boardList(startBoardNum, boardCountInPage);
    }

    @Override
    public int boardTotalCount() {
        return dao.boardTotalCount();
    }

    @Override
    public List<NboardVO> boardList2(int startBoardNum, int boardCountInPage) {
        return dao.boardList2(startBoardNum, boardCountInPage);
    }

    @Override
    public int boardTotalCount2() {
        return dao.boardTotalCount2();
    }

    @Override
    public int boardRegister(NboardVO nboardVO) {
        return dao.boardRegister(nboardVO);
    }

    @Override
    public NboardVO boardDetail(int boNo) {
        return dao.boardDetail(boNo);
    }

    @Override
    public void boardDelete(int boNo) {
        dao.boardDelete(boNo);
    }

    @Override
    public List<boardCommentVO> list(int boNo) {
        return dao.list(boNo);
    }

    @Override
    public void write(boardCommentVO vo) {
        dao.write(vo);

    }

    @Override
    public int commentTotalCount(int boNo) {
        return dao.commentTotalCount(boNo);
    }

}
