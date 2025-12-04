# spring-boot-tabs-app

Simple Spring Boot application demonstrating:
- Thymeleaf + Bootstrap UI (3 tabs)
- H2 in-memory DB, Spring Data JPA
- REST API for tasks
- Sample data on startup

## Run
1. `mvn clean package`
2. `mvn spring-boot:run`
3. Open http://localhost:8080

H2 console: http://localhost:8080/h2-console (JDBC URL: `jdbc:h2:mem:tabsdb`)
