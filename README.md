# SmartFinanceHub - Modern Personal Finance System

<p align="center">
  <img src="src/main/resources/static/images/logo.svg" alt="SmartFinanceHub Logo" width="120" height="120">
</p>

<p align="center">A powerful, feature-rich personal finance management application built with Java Spring Boot</p>

<p align="center">
  <b>Developed and maintained by SpyDev (shaikyaseensy737@gmail.com)</b>
</p>

<p align="center">
  <a href="#features">Features</a> •
  <a href="#tech-stack">Tech Stack</a> •
  <a href="#recent-enhancements">Recent Enhancements</a> •
  <a href="#setup-locally">Setup Locally</a> •
  <a href="#setup-with-docker">Setup With Docker</a> •
  <a href="#usage">Usage</a>
</p>

<p align="center">
  <a target='_blank' href='https://plutocracy.herokuapp.com/plutocracy/swagger-ui.html'>View API Documentation (Swagger-UI)</a>
</p>

## Tech Stack <a name="tech-stack"></a>

### Backend
* Java 15
* Spring Boot 2.5
* Spring Security with JWT Authentication
* Spring Data JPA/Hibernate with optimized configurations
* PostgreSQL for primary database
* Redis for caching and performance optimization
* OpenAPI (Swagger-UI) for API documentation
* Lombok for reducing boilerplate code

### Frontend & UI
* Modern responsive design with custom CSS
* Interactive UI with JavaScript enhancements
* Dark/Light mode support
* Thymeleaf for server-side templating
* Chart.js for financial data visualization

### DevOps & Infrastructure
* Docker and Docker Compose for containerization
* Nginx for reverse proxy, caching, and compression
* Optimized Hikari connection pool
* Performance monitoring with custom AOP

## Recent Enhancements <a name="recent-enhancements"></a>

As the maintainer of this project, I (SpyDev) have implemented several significant improvements:

### Performance Optimizations
* Implemented Redis caching for frequently accessed data
* Optimized Hikari connection pool for better database performance
* Added Hibernate batch processing for improved write operations
* Implemented performance monitoring with AOP to detect slow operations

### UI/UX Improvements
* Completely redesigned the UI with a modern, clean aesthetic
* Added dark mode support with persistent user preference
* Created responsive design that works beautifully on all devices
* Enhanced dashboard with interactive financial charts
* Added toast notifications for better user feedback

### Infrastructure Upgrades
* Created an optimized Docker Compose setup with proper health checks
* Added Nginx as a reverse proxy with caching and compression
* Implemented resource limits for better container management

## Data Model
##### SQL Migration Scripts can be viewed at src/main/resources/db/migration
##### Read in detail about entities used in ENTITIES.md in project root.
![ER Diagram of Database Entities](https://user-images.githubusercontent.com/69693621/119250906-e7159b80-bbc0-11eb-930d-944714b986f6.jpeg)


## Security Flow
* On Successful validation of login credentials, a JWT will be returned representing the user **(decode the below sample JWT on jwt.io for reference)**

```
eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYXJkaWsuYmVobDc0NDRAZ21haWwuY29tIiwiYWNjb3VudF9jcmVhdGlvbl90aW1lc3RhbXAiOiIyMDIxLTA1LTIyVDExOjIyOjE5LjQ5MTQ4NiIsInVzZXJfaWQiOiIzODQ3ZjYxYy1hNjc0LTQ0N2UtYmQ0ZC0wZThhODk3NTg2YmQiLCJ0b3RhbF9iYWxhbmNlX2lkIjoiMWQyZWNiMzctMDNkNS00YjhhLWI0Y2MtMDllZTBmYjQwMDM3Iiwic2NvcGUiOiJ1c2VyIiwibmFtZSI6IkhhcmRpayBCZWhsIiwiZXhwIjoxNjIxNzA4NDE0LCJpYXQiOjE2MjE2NzI0MTR9.XaqcTVYUuBIBtp74pJK-_mTtQCYMWdduoWGoYhsSxD4
```
* The received JWT should be included in the headers when calling a protected API
* Authentication Bearer format to be used **(Header key should be 'Authentication' and value should start with Bearer followed with a single blank space and recieved JWT)**

```
Authentication : Bearer <JWT>
```

## Features <a name="features"></a>

### User Account Management
* 🔐 Secure user registration and authentication
* 🔑 JWT-based authorization with role-based access control
* 👤 User profile management and password updates

### Financial Management
* 💰 Track balances across multiple accounts and categories
* 📊 Real-time visualization of financial data with interactive charts
* 📈 Monitor current expenses and income with detailed breakdowns
* 📅 Plan for future financial events with upcoming expenses/income tracking

### Goal Setting & Tracking
* 🎯 Create personalized financial goals with target dates
* 📌 Track progress toward goals with visual indicators
* 🔔 Receive notifications when goals are achieved

### Budgeting & Analysis
* 📝 Set monthly spending thresholds across categories
* 🔄 Automated calculations at month-end (using cron expressions)
* 📉 Trend analysis of spending patterns over time

### Organization & Notes
* 📋 Create and manage financial notes for future reference
* 🏷️ Tag system for expenses, income, and notes for easy filtering
* 🔍 Advanced search functionality across all financial data

### Modern UI Experience
* 🌓 Dark/Light mode toggle with persistent user preference
* 📱 Fully responsive design that works on all devices
* 🔔 Toast notifications for improved user feedback
* ⚡ Optimized performance with Redis caching


## Setup Locally <a name="setup-locally"></a>

### Prerequisites

* Java 15 (or higher)
* Maven 3.6+ 
* PostgreSQL 12+
* Redis (optional, for enhanced caching)

> 💡 **Recommended**: Use [SDKMAN!](https://sdkman.io/) for installing Java and Maven

### Database Setup

1. Create a PostgreSQL user:

```sql
CREATE USER plutocracy WITH PASSWORD 'plutocracy' SUPERUSER;
```

2. Create the database and assign permissions:

```sql
CREATE DATABASE plutocracy;
GRANT ALL PRIVILEGES ON DATABASE plutocracy TO plutocracy;
```

### Application Setup

1. Clone the repository:

```bash
git clone https://github.com/spydev/plutocracy.git
cd plutocracy
```

2. Build the application:

```bash
mvn clean install
```

3. Run the application:

```bash
# Option 1: Using Maven
mvn spring-boot:run

# Option 2: Using the JAR file
java -jar target/personal-finance-management-system-0.0.1-SNAPSHOT.jar
```

4. Access the application:
   * Web UI: http://localhost:9090/plutocracy
   * API Documentation: http://localhost:9090/plutocracy/swagger-ui.html

> ⚙️ **Note**: You can customize the port and context path in `application.properties`

---

## Setup With Docker <a name="setup-with-docker"></a>

### Prerequisites

* Docker Engine 19.03+
* Docker Compose 1.27+
* Java 15 (for building only)
* Maven 3.6+ (for building only)

### Quick Start

1. Build the application (if not already built):

```bash
mvn clean install
```

2. Start the application using our optimized Docker Compose setup:

```bash
# Use the optimized configuration
docker-compose -f docker-compose.optimized.yml up -d
```

> ✨ **New**: The optimized Docker Compose configuration includes Redis caching, Nginx for better performance, and proper health checks!

### Services Included

* **Application Service**: Spring Boot application running on port 9090
* **PostgreSQL**: Database service with data persistence (port 6432)
* **Redis**: Caching service for improved performance (port 6379)
* **Nginx**: Reverse proxy with compression and caching (port 80)

### Management Commands

```bash
# View logs
docker-compose -f docker-compose.optimized.yml logs -f service

# Stop all containers
docker-compose -f docker-compose.optimized.yml stop

# Stop and remove containers, networks, images, and volumes
docker-compose -f docker-compose.optimized.yml down
```

### Access Points

* **Web UI**: http://localhost/plutocracy
* **API Documentation**: http://localhost/plutocracy/swagger-ui.html
* **Direct Spring Boot access**: http://localhost:9090/plutocracy

## Usage <a name="usage"></a>

### Authentication Flow

Plutocracy uses JWT (JSON Web Token) for secure authentication:

1. Register a new account or log in with existing credentials
2. Upon successful login, you'll receive a JWT token
3. This token must be included in the header of subsequent API requests:
   ```
   Authentication: Bearer <your-jwt-token>
   ```

> 🔐 **Sample JWT**: 
> ```
> eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJoYXJkaWsuYmVobDc0NDRAZ21haWwuY29tIiwiYWNjb3VudF9jcmVhdGlvbl90aW1lc3RhbXAiOiIyMDIxLTA1LTIyVDExOjIyOjE5LjQ5MTQ4NiIsInVzZXJfaWQiOiIzODQ3ZjYxYy1hNjc0LTQ0N2UtYmQ0ZC0wZThhODk3NTg2YmQiLCJ0b3RhbF9iYWxhbmNlX2lkIjoiMWQyZWNiMzctMDNkNS00YjhhLWI0Y2MtMDllZTBmYjQwMDM3Iiwic2NvcGUiOiJ1c2VyIiwibmFtZSI6IkhhcmRpayBCZWhsIiwiZXhwIjoxNjIxNzA4NDE0LCJpYXQiOjE2MjE2NzI0MTR9.XaqcTVYUuBIBtp74pJK-_mTtQCYMWdduoWGoYhsSxD4
> ```
> You can decode this at [jwt.io](https://jwt.io) to see the information it contains.

### Using the Swagger UI

The Swagger UI provides an interactive way to explore and test the API:

1. Navigate to http://localhost:9090/plutocracy/swagger-ui.html
2. Click on any endpoint to expand its details
3. Click **Try it out** to prepare a request
4. Fill in any required parameters
5. Click **Execute** to send the request

#### Authenticating in Swagger UI

1. Click the **Authorize** button at the top right
2. In the popup dialog, enter your JWT token in the format: `Bearer <your-jwt-token>`
3. Click **Authorize** and close the dialog
4. Now all your API requests will include the authentication token

### Using the Web Interface

The application also provides a modern web interface with:

* Dashboard overview of your finances
* Transaction management
* Goal setting and tracking
* Financial notes and tags
* Account settings

The UI supports both light and dark modes - click the mode toggle in the bottom right corner to switch between them.

---

## Contributing

Contributions are welcome! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for guidelines.

## License

This project is maintained by SpyDev (shaikyaseensy737@gmail.com). All rights reserved.


