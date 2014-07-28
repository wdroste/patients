grails.servlet.version = '2.5' // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = 'target/classes'
grails.project.test.class.dir = 'target/test-classes'
grails.project.test.reports.dir = 'target/test-reports'
grails.project.target.level = 1.7
grails.project.source.level = 1.7
//grails.project.war.file = 'target/${appName}-${appVersion}.war'

// uncomment (and adjust settings) to fork the JVM to isolate classpaths
//grails.project.fork = [
//   run: [maxMemory:1024, minMemory:64, debug:false, maxPerm:256]
//]

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits('global') {
        // specify dependency exclusions here; for example, uncomment this to disable ehcache:
        // excludes 'ehcache'
    }
    log 'error' // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve
    legacyResolve false // whether to do a secondary resolve on plugin installation, not advised and here for backwards compatibility

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        grailsPlugins()
        grailsHome()
        grailsCentral()

        mavenLocal()
        mavenCentral()

        mavenRepo 'http://repo.grails.org/grails/core'
    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes e.g.
        runtime 'com.h2database:h2:1.3.175'
        runtime 'net.sf.supercsv:super-csv:2.1.0'
        runtime 'com.google.guava:guava:16.0.1'
        runtime 'commons-net:commons-net:3.3'
    }

    plugins {
        // plugins for the build system only
        build ':tomcat:7.0.50'

        // plugins for the compile step
        compile ':scaffolding:2.0.1'
        compile ':cache:1.1.1'

        // plugins needed at runtime but not for compilation
        runtime ':hibernate:3.6.10.7' // or ':hibernate4:4.1.11.6'
        runtime ':database-migration:1.3.8'
        runtime ':jquery:1.8.3'
        runtime ":zipped-resources:1.0.1"
        runtime ':resources:1.2.1'
        runtime ':yui-minify-resources:0.1.5'

        // my plugins
        runtime ':war-exec:1.0.3'
        runtime ':fields:1.3'
        compile ':twitter-bootstrap:2.3.2'
        compile ':shiro:1.2.0'
        compile ':searchable:0.6.6'
    }
}
