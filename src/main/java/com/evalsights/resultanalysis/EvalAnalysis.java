package com.evalsights.resultanalysis;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.evalsights.resultanalysis.io.XMLFileReader;
import com.evalsights.resultanalysis.model.Evaluations;

/**
 * The Class ProcessMining is main class to initiate the Proces Mining System. It acts as the head controller of the system.
 */
public class EvalAnalysis {
	private static Logger logger = LogManager.getLogger(EvalAnalysis.class);
	
	private static EvalAnalysis ea;
	
	private XMLFileReader xmlFileReader;
	
	private Evaluations ev;
	
	public static EvalAnalysis getInstance() {
		if(ea == null) {
			ea = new EvalAnalysis();
			ea.loadConfig(null);
			ea.initEnvironment();
		}
		
		return ea;
	}
	
	
	/**
	 * Gets the system file path to this class (requirred to load config based on a given relative definition etc.).
	 *
	 * @return the system class path (absolute path)
	 */
	protected String getSystemClassPath() {
		return this.getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
	}
	
	
	/**
	 * Loads the configuration file.
	 *
	 * @param relativeConfigPath the relative config path
	 */
	private void loadConfig(String relativeConfigPath) {
		String path = getSystemClassPath();
		//System.out.println("path to config set (temp): " + path);
		int pos = path.lastIndexOf("WEB-INF");
		
		if(relativeConfigPath != null && relativeConfigPath.length() > 0) {
			
			Integer localPathDoublepoint = relativeConfigPath.indexOf(":");
			if(localPathDoublepoint != null && localPathDoublepoint == 1) {
				
				path = relativeConfigPath;
				readPropertiesFromFile(path);
				//System.out.println("path to config set (1): " + path);
				logger.info("path to config set (1): {}", path);
			} else {
				pos = path.lastIndexOf('/', 3);
				//path = path.substring(1,pos) + "/";
				path = path.substring(0,pos) + "/";
				path += CONST.configFile;
				readPropertiesFromFile(path);
				//System.out.println("path to config set (2): " + path);
				logger.info("path to config set (2): {}", path);
			}
		} else if(pos > 0) {
			//path = path.substring(1,pos) + "WEB-INF/";
			path = path.substring(0,pos) + "WEB-INF/";
			//path = path.substring(1,pos);
			path += CONST.configFile;
			readPropertiesFromFile(path);
			//System.out.println("path to config set (3): " + path);
			logger.info("path to config set (3): {}", path);
		} else {
			//System.out.println("Config for SemaService not found: " + path);
			logger.error("Config for SemaService not found at: {}" + path);
		}
	}
	
	/**
	 * Read properties from file and  returns the properties. Parallel the propeties are also extracted and set in the CONST class.
	 *
	 * @param configPath the config path
	 * @return the properties
	 */
	private Properties readPropertiesFromFile(String configPath) {
		Properties properties = new Properties();
		try {
			BufferedInputStream stream;
			stream = new BufferedInputStream(new FileInputStream(configPath));
			properties.load(stream);
			stream.close();
			
			CONST.folderExperiments = properties.getProperty("folder-experiment");
			CONST.folderQuestionnaires = properties.getProperty("folder-questionnaires");
			CONST.folderResults = properties.getProperty("folder-results");
		} catch (FileNotFoundException e) {
			logger.error(e);
		} catch (IOException e) {
			logger.error(e);
		}
		
		initEnvironment();
		
		return properties;
	}
	
	
	/**
	 * Inits the SemaService environment.
	 */
	private void initEnvironment() {
		xmlFileReader = new XMLFileReader();
		loadEvaluations();
	}
	
	
	/**
	 * Load evaluations.
	 */
	public void loadEvaluations() {
		ev = new Evaluations();	//Resetting previouse Result reads
		
		xmlFileReader.readExperiments();
		xmlFileReader.readQuestionnaires();
		xmlFileReader.readResults();
		
		//Here must be somthing lik 
		//ev.setExperiments(xmlFileReader.getExperiments);
		//ev.setExperiments(xmlFileReader.getForms);
	}


	/**
	 * Gets the evaluations.
	 *
	 * @return the evaluations
	 */
	public Evaluations getEvaluations() {
		return ev;
	}


	public static void main(String[] args) {
		// TODO Auto-generated method stub

	}

}
