package com.atguigu.crud.bean;

public class StudentByClass {
	 private Integer id;

	    private String name;

	    private Byte age;

	    private String sex;

	    private Integer score;
	    
	   private Classes classes;

		    public Classes getClasses() {
			return classes;
		}
	
		public void setClasses(Classes classes) {
			this.classes = classes;
		}

		public Integer getId() {
	        return id;
	    }

	    public void setId(Integer id) {
	        this.id = id;
	    }

	    public String getName() {
	        return name;
	    }

	    public void setName(String name) {
	        this.name = name == null ? null : name.trim();
	    }

	    public Byte getAge() {
	        return age;
	    }

	    public void setAge(Byte age) {
	        this.age = age;
	    }

	    public String getSex() {
	        return sex;
	    }

	    public void setSex(String sex) {
	        this.sex = sex == null ? null : sex.trim();
	    }

	    public Integer getScore() {
	        return score;
	    }

	    public void setScore(Integer score) {
	        this.score = score;
	    }

		@Override
		public String toString() {
			return "StudentByClass [id=" + id + ", name=" + name + ", age=" + age + ", sex=" + sex + ", score=" + score
					+ ", classes=" + classes + "]";
		}

		public StudentByClass(Integer id, String name, Byte age, String sex, Integer score, Classes classes) {
			super();
			this.id = id;
			this.name = name;
			this.age = age;
			this.sex = sex;
			this.score = score;
			this.classes = classes;
		}
		public StudentByClass() {
			// TODO Auto-generated constructor stub
		}
   
}
