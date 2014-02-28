import org.springframework.jdbc.core.JdbcTemplate

beans = {
    jdbcTemplate(JdbcTemplate) {
        dataSource = ref('dataSource')
    }
}
