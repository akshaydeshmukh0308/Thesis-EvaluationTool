package com.evalsights.resultanalysis.model;

import java.util.ArrayList;

import com.evalsights.resultanalysis.model.forms.IForm;

public class Evaluations {
	
	private ArrayList<Experiment> experiments = new ArrayList<>();
	
	private ArrayList<IForm> forms = new ArrayList<>();

	
	public ArrayList<Experiment> getExperiments() {
		return experiments;
	}

	public void setExperiments(ArrayList<Experiment> experiments) {
		this.experiments = experiments;
	}

	public ArrayList<IForm> getForms() {
		return forms;
	}

	public void setForms(ArrayList<IForm> forms) {
		this.forms = forms;
	}
}
