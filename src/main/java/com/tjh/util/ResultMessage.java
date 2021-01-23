package com.tjh.util;

/**
 * IntelliJ IDEA.
 *
 * @author
 * 创建时间 2020/11/12 16:28
 * 描述 用于返回数据类
 */
public class ResultMessage {
    public static String SUCCESSFUL = "success";
    public static String FAIL = "fail";
    public static int SUCCESSCODE = 200;
    public static int FAILCODE = 500;
    private String state = SUCCESSFUL;
    private String describe = "";
    private int code = SUCCESSCODE;
    private Object data;

    public ResultMessage(Object data, String desc){
        if(data == null){
            this.state = FAIL;
            this.code = FAILCODE;
        }
        this.describe = desc;
        this.data = data;
    }
    public ResultMessage(int code, Object data, String desc){
        this.state = FAIL;
        this.describe = desc;
        this.code = code;
        this.data = data;
    }

    public static ResultMessage success(Object data,String desc){
        return new ResultMessage(data,desc);
    }

    public static ResultMessage erreo(int code,Object data,String desc){
        return new ResultMessage(code,data,desc);
    }

    public static ResultMessage success(Object data){
        return new ResultMessage(data,"");
    }
    public static ResultMessage successDesc(String describe){
        return new ResultMessage(ResultMessage.SUCCESSCODE,describe);
    }
    public static ResultMessage erreo(String desc){
        return new ResultMessage(ResultMessage.FAILCODE,null,desc);
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getDescribe() {
        return describe;
    }

    public void setDescribe(String describe) {
        this.describe = describe;
    }

    @Override
    public String toString() {
        return "ResultMessage{" +
                "state='" + state + '\'' +
                ", describe='" + describe + '\'' +
                ", code=" + code +
                ", data=" + data +
                '}';
    }
}
