package FanSubmittedDAO_MySQL;

public class FanQuestions {
    private int question_id;
    private int memberId;
    private String fanQuestion;
    private String fanAnswer;
    private String wrongAnswer1;
    private String wrongAnswer2;
    private String wrongAnswer3;

    public boolean isQuestionStatus() {
        return questionStatus;
    }

    public void setQuestionStatus(boolean questionStatus) {
        this.questionStatus = questionStatus;
    }

    private boolean questionStatus;

    public int getQuestion_id() {
        return question_id;
    }

    public void setQuestion_id(int question_id) {
        this.question_id = question_id;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getFanQuestion() {
        return fanQuestion;
    }

    public void setFanQuestion(String fanQuestion) {
        this.fanQuestion = fanQuestion;
    }

    public String getFanAnswer() {
        return fanAnswer;
    }

    public void setFanAnswer(String fanAnswer) {
        this.fanAnswer = fanAnswer;
    }

    public String getWrongAnswer1() {
        return wrongAnswer1;
    }

    public void setWrongAnswer1(String wrongAnswer1) {
        this.wrongAnswer1 = wrongAnswer1;
    }

    public String getWrongAnswer2() {
        return wrongAnswer2;
    }

    public void setWrongAnswer2(String wrongAnswer2) {
        this.wrongAnswer2 = wrongAnswer2;
    }

    public String getWrongAnswer3() {
        return wrongAnswer3;
    }

    public void setWrongAnswer3(String wrongAnswer3) {
        this.wrongAnswer3 = wrongAnswer3;
    }
}
