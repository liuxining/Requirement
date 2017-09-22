package domain;

public class RequirementBean {
	private int id;
	private String name;
	private String intro;
	private String researchType;
	private String cooperationModel;
	private double planAllInvest;
	private int status;
	private String craeteDate;
	
	
		
	public String getCraeteDate() {
		return craeteDate;
	}

	public void setCraeteDate(String craeteDate) {
		this.craeteDate = craeteDate;
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

	public String getCooperationModel() {
		return cooperationModel;
	}

	public void setCooperationModel(String cooperationModel) {
		this.cooperationModel = cooperationModel;
	}

	public double getPlanAllInvest() {
		return planAllInvest;
	}

	public void setPlanAllInvest(double planAllInvest) {
		this.planAllInvest = planAllInvest;
	}

}
