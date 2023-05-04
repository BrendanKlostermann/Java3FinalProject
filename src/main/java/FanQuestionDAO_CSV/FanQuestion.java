package FanQuestionDAO_CSV;

public class FanQuestion {

    private int questionID;
    private String fanQuestionCSV;
    private String option1;
    private String option2;
    private String option3;
    private String option4;
    private String answer;
    private String email;

    public FanQuestion(){

    }

    public FanQuestion(int questionID, String question, String option1, String option2, String option3, String option4, String answer, String email){
        this.questionID = questionID;
        this.fanQuestionCSV = question;
        this.option1 = option1;
        this.option2 = option2;
        this.option3 = option3;
        this.option4 = option4;
        this.answer = answer;
        this.email = email;
    }

    public int getQuestionID() {
        return questionID;
    }

    public void setQuestionID(int questionID) {
        this.questionID = questionID;
    }

    public String getQuestion() {
        return fanQuestionCSV;
    }

    public void setQuestion(String question) {
        this.fanQuestionCSV = question;
    }

    public String getOption1() {
        return option1;
    }

    public void setOption1(String option1) {
        this.option1 = option1;
    }

    public String getOption2() {
        return option2;
    }

    public void setOption2(String option2) {
        this.option2 = option2;
    }

    public String getOption3() {
        return option3;
    }

    public void setOption3(String option3) {
        this.option3 = option3;
    }

    public String getOption4() {
        return option4;
    }

    public void setOption4(String option4) {
        this.option4 = option4;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
}
