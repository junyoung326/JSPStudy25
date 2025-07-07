package dto;

public class MovieDTO {
	private int id;
	private String title;
	private String summary;
	private String posterUrl;
	private String imagePath;
	private String Description;

	public int getId() {
		return id;
	}

	public String getDescription() {
        return Description;
    }

    public void setDescription(String description) {
        this.Description = description;
    }
	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getPosterUrl() {
		return posterUrl;
	}

	public void setPosterUrl(String posterUrl) {
		this.posterUrl = posterUrl;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

}
