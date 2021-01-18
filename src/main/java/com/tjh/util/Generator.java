package com.tjh.util;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.InvalidConfigurationException;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

public class Generator {

	public static void main(String[] args) throws IOException, XMLParserException, InvalidConfigurationException, SQLException, InterruptedException {
		// TODO Auto-generated method stub
		List<String> warnings = new ArrayList<String>();
	    boolean overwrite = true;
	    String url1 = "F:\\javaWorkSpace\\eclipseWorkSpaceOthers\\SSM\\src\\main\\resources\\\\generator.xml";
	    String url2 = "E:\\Project-Work-Space\\eclipse-Workspace\\SSM\\src\\main\\resources\\generator.xml";
	    File configFile = new File(url1);
	    File path = configFile.getParentFile();
	    System.out.println(path);
	    ConfigurationParser cp = new ConfigurationParser(warnings);
	    Configuration config = cp.parseConfiguration(configFile);
	    DefaultShellCallback callback = new DefaultShellCallback(overwrite);
	    MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
	    myBatisGenerator.generate(null);
	    System.out.println("成功！");
	}

}
