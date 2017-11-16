package com.evalsights.resultanalysis.io;

import com.evalsights.resultanalysis.CONST;

public class XMLFileReader {
	
	public XMLFileReader() {}
	
	public void readExperiments() {
		System.out.println("Read Experiments from");
		System.out.println(CONST.folderExperiments);
		
	}
	
	public void readQuestionnaires() {
		System.out.println("Read Questionnaires from");
		System.out.println(CONST.folderQuestionnaires);
	}
	
	public void readResults() {
		System.out.println("Read Results from");
		System.out.println(CONST.folderResults);
	}

}
