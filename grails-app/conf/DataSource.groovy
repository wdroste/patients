dataSource {
    pooled = true
    driverClassName = "com.mysql.jdbc.Driver"
    dialect = "org.hibernate.dialect.MySQL5InnoDBDialect"
    url = "jdbc:mysql://localhost/shcc?useUnicode=yes&characterEncoding=UTF-8"

    properties {
        maxActive = 10
        maxIdle = 2
        minIdle = 1
        initialSize = 3
        testOnBorrow = true
        minEvictableIdleTimeMillis = 60000
        timeBetweenEvictionRunsMillis = 60000
        maxWait = 10000
        validationQuery = '/* ping */'
    }
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = true
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            logSql = true
            dbCreate = "update"
            //dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            username = "root"
            password = "cloud"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            username = "root"
            password = "cloud"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            username = "root"
            password = "heartheart"
        }
    }
}