

dataSource {
	dialect = org.hibernate.dialect.MySQL5InnoDBDialect
	pooled = true
	jmxExport = true
	driverClassName = "com.mysql.jdbc.Driver"
	properties {
		maxActive = -1
		minEvictableIdleTimeMillis=1800000
		timeBetweenEvictionRunsMillis=1800000
		numTestsPerEvictionRun=3
		testOnBorrow=true
		testWhileIdle=true
		testOnReturn=true
		validationQuery="SELECT 1"
	  }
}
environments {
	development {
		dataSource {
			dbCreate = "create"
			username = "root"
			password = ""
			url = 'jdbc:mysql://localhost/gticket'
			}
		}
	}