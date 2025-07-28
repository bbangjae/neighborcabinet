package com.neighborCabinet.project.model;

public class FileVO {
    private int fileNo; // 파일 ID
    private String originalFileName; // 파일의 원래 이름
    private String savedFileName; // 중복 방지를 위한 랜덤스트링 포함한 파일 이름
    private int pId; // 연결된 공간등록 글 번호

    public int getFileNo() {
        return fileNo;
    }

    public void setFileNo(int fileNo) {
        this.fileNo = fileNo;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName;
    }

    public String getSavedFileName() {
        return savedFileName;
    }

    public void setSavedFileName(String savedFileName) {
        this.savedFileName = savedFileName;
    }

    public int getpId() {
        return pId;
    }

    public void setpId(int pId) {
        this.pId = pId;
    }
}
