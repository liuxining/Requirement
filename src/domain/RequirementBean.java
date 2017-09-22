package domain;

public class RequirementBean {
	private int id;
	private String name;
	private int userId;
	private String intro;
	private String researchType;
	private int cooperationModel;
	private double planAllInvest;
	private int status;
	private String createDate;
	private String suggest;
	
	
	
	
	
		
	public String getSuggest() {
		return suggest;
	}

	public void setSuggest(String suggest) {
		this.suggest = suggest;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	
	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	
	public String getResearchType() {
		return researchType;
	}

	public void setResearchType(String researchType) {
		this.researchType = researchType;
	}

	
	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	
	public int getCooperationModel() {
		return cooperationModel;
	}

	public void setCooperationModel(int cooperationModel) {
		this.cooperationModel = cooperationModel;
	}

	public double getPlanAllInvest() {
		return planAllInvest;
	}

	public void setPlanAllInvest(double planAllInvest) {
		this.planAllInvest = planAllInvest;
	}

	@Override
	public String toString() {
		return "RequirementBean [id=" + id + ", name=" + name + ", userId=" + userId + ", intro=" + intro
				+ ", researchType=" + researchType + ", cooperationModel=" + cooperationModel + ", planAllInvest="
				+ planAllInvest + ", status=" + status + ", createDate=" + createDate + ", suggest=" + suggest + "]";
	}

	
	

}
