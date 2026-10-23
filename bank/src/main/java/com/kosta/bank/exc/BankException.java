package com.kosta.bank.exc;

public class BankException extends Exception{
	ERR_CODE errCode;
	
	public BankException(String message, ERR_CODE errCode) {
		super(message);
		this.errCode = errCode;
	}
	
	public BankException(ERR_CODE errCode) {
		this.errCode = errCode;
	}
	
	@Override
	public String toString() {
		String message = "";
		if(getMessage()!=null && !getMessage().isEmpty()) {
			message += "\n[" + getMessage() + "]";
		}
		switch(errCode) {
		case ACCID: message += "怨꾩쥖踰덊샇媛� ��由쎈땲�떎.\n"; break;
		case SENDACCID: message += "蹂대궡�뒗 怨꾩쥖踰덊샇媛� ��由쎈땲�떎.\n"; break;
		case RECVACCID: message += "諛쏅뒗 怨꾩쥖踰덊샇媛� ��由쎈땲�떎."; break;
		case DOUBLEID:message += "怨꾩쥖踰덊샇媛� 以묐났�맗�땲�떎."; break;
		case DEPOSIT: message+="�엯湲덉븸�쓣 �솗�씤�븯�꽭�슂"; break;
		case WITHDRAW: message += "�옍�븸�씠 遺�議깊빀�땲�떎"; break;
		case MENU: message += "硫붾돱瑜� �옒紐� �꽑�깮�뻽�뒿�땲�떎.\n"; break;
		case PASSWORD: message += "鍮꾨�踰덊샇瑜� �옒紐� �엯�젰�뻽�뒿�땲�떎."; break;
		case NODATA: message += "媛쒖꽕�맂 怨꾩쥖媛� �뾾�뒿�땲�떎."; break;
		}
		return message;
	}
}
