# 🚂 RailSathi Backend - Dockerized FastAPI Application

## Project Overview
This project demonstrates the containerization of an existing FastAPI application called **RailSathi Backend**, a comprehensive complaint management system for railway services. The assignment goal was to successfully dockerize the application along with a PostgreSQL database using Docker and Docker Compose, while ensuring all services work together seamlessly.

## How to Set Up the Project

### Prerequisites
Before running this project, make sure you have:
- Docker Desktop installed and running on your system
- Git installed for cloning the repository
- At least 4GB of available RAM for containers

### Step-by-Step Setup Instructions

**1. Clone the Repository**
```bash
git clone https://github.com/s2pl/RailSathiBE
cd RailSathiBE
```
**2. Environment Configuration**

Since the `.env` file is not included in the repository (for security), you need to create it:

```bash
# Copy the example file and create your .env
cp .env.example .env
```

Or manually create a `.env` file with these contents:
```env
# Database Configuration
POSTGRES_HOST=db
POSTGRES_PORT=5432
POSTGRES_USER=postgres
POSTGRES_PASSWORD=password
POSTGRES_DB=rail_sathi_db

# Email Configuration (for testing)
MAIL_USERNAME=test@example.com
MAIL_PASSWORD=test_password
MAIL_FROM=test@example.com
```

**Note**: The `.env.example` file serves as a template showing what environment variables are required. The actual `.env` file is gitignored for security reasons.

**3. Build and Run with Docker**

```bash
docker-compose up --build
```
**4. Access the Application**

Once the containers are running, you can access:

- **🎯 Assignment Endpoint**: http://localhost:8000/items/ *(Main requirement)*
- **📚 API Documentation**: http://localhost:8000/rs_microservice/docs *(Interactive Swagger UI)*
- **🏠 Base API Endpoint**: http://localhost:8000/rs_microservice
- **💓 Health Check**: http://localhost:8000/health

**Note**: Wait for both containers to be fully started before accessing the endpoints. The application uses a startup script to ensure the database is ready.


**5. Stop the Application**
```bash
docker-compose down
```

## 🛠️ Technologies Used
- **FastAPI** 🚀 - Modern, high-performance Python web framework for building APIs
- **PostgreSQL** 🐘 - Powerful open-source relational database system  
- **Docker** 🐳 - Containerization platform for consistent deployment
- **Docker Compose** 🎼 - Multi-container orchestration tool
- **Python 3.9** 🐍 - Programming language and runtime environment
- **Uvicorn** ⚡ - Lightning-fast ASGI server for running FastAPI applications

## 🔗 API Endpoints

### 🎯 Assignment Required Endpoints
- `GET /items/` - **Main assignment requirement** - Returns demo items with application status

### 🏠 Application Base Endpoints  
- `GET /rs_microservice` - Root service endpoint
- `GET /rs_microservice/docs` - Interactive API documentation (Swagger UI)
- `GET /health` - Application health check endpoint

### 📝 Complaint Management System
- `GET /rs_microservice/complaint/get/{id}` - Retrieve specific complaint by ID
- `POST /rs_microservice/complaint/add/` - Create a new complaint
- `PUT/PATCH /rs_microservice/complaint/update/{id}` - Update existing complaint
- `DELETE /rs_microservice/complaint/delete/{id}` - Delete a complaint

## Key Features Implemented (What I did during the assignment) 

**🎯 Assignment Requirements Completed:**

✅ **1. Django/FastAPI Project**
- Cloned from https://github.com/s2pl/RailSathiBE
- Successfully runs locally and in Docker
- **Assignment endpoint**: `/items/` accessible at http://localhost:8000/items/

✅ **2. Dockerization**
- **Dockerfile**: Uses official Python 3.9-slim base image
- **Dependencies**: Installs from requirements.txt
- **Server**: Starts FastAPI development server on port 8000

✅ **3. Docker Compose**
- **Multi-service**: Runs FastAPI app + PostgreSQL database
- **Environment**: Configured via .env file
- **Networking**: App connects to PostgreSQL via Docker networking

✅ **4. Database Configuration** 
- PostgreSQL container as database
- Docker Compose networking (`POSTGRES_HOST=db`)
- Environment variables for database connection

✅ **5. Startup Requirements**
- ✅ `docker-compose up` starts both services
- ✅ Database connectivity verified
- ✅ **Assignment URL**: http://localhost:8000/items/ accessible

✅ **6. Bonus Features Implemented**
- ✅ **wait-for-it.sh**: Handles database startup timing
- ✅ **API Documentation**: Swagger docs at `/rs_microservice/docs`
- ✅ **Hot-reloading**: Volume mapping for development
- ✅ **Advanced Features**: File uploads, email system, comprehensive CRUD API

**🚀 Additional Features Beyond Assignment:**

**1. Dockerized the FastAPI application** 
- Created Dockerfile to containerize the existing app

**2. Database containerization** 
- Set up PostgreSQL database in a Docker container

**3. Multi-service orchestration** 
- Created docker-compose.yml to run app and database together

**4. Environment configuration management** 
- Set up proper .env file handling for different environments

**5. Container networking** 
- Configured app to communicate with database using Docker networking (POSTGRES_HOST=db)

**6. Dependency management** 
- Fixed missing dependencies (added pytz) and Windows compatibility issues (commented out uvloop)

**7. Production-ready deployment** 
- Made the application portable and easy to deploy anywhere with Docker

**8. Documentation** 
- Created comprehensive setup instructions and project documentation

**9. Hot-reloading development setup**
- Added volume mapping for live code changes without container rebuild


## Limitations and Assumptions Made

**1. Email functionality uses test credentials** 
- Not connected to real email service, using placeholder values for testing

**2. Database runs with default PostgreSQL settings** 
- Suitable for development but may need optimization for production

**3. No SSL/HTTPS configuration** 
- Development environment setup, production would need secure connections

**4. No user authentication implemented** 
- Open API for testing purposes, real deployment would need auth

**5. Assumes Docker Desktop is available and running** 
- Required for containerization, must be installed and active

**6. Windows compatibility issues with uvloop package** 
- Commented out in requirements.txt due to Linux/macOS only support

**7. Missing Dependencies**
- Encountered `ModuleNotFoundError: No module named 'pytz'` 
- The original requirements.txt was incomplete
- Added pytz==2023.3 to requirements.txt with a comment explaining why

## Project Structure
```
RailSathiBE/
├── 📄 Dockerfile                 # Container configuration
├── 📄 docker-compose.yml         # Multi-service orchestration  
├── 📄 requirements.txt           # Python dependencies
├── 📄 .env                       # Environment variables (local)
├── 📄 .env.example              # Environment template
├── 📄 wait-for-it.sh            # Database startup timing script
├── 📄 main.py                   # FastAPI application entry point
├── 📄 database.py               # Database connection configuration
├── 📄 services.py               # Business logic and services
├── 📄 mail_config.py            # Email configuration
├── 📁 utils/                    # Utility functions
│   └── email_utils.py
├── 📁 templates/                # Email templates
│   └── complaint_creation_email_template.txt
└── 📄 README.md                 # Project documentation
```

## Author & Assignment Details

**Backend Development Assignment - Dockerization of Django/FastAPI Application**

- **Assignment**: Docker Containerization & Multi-Service Deployment
- **Framework**: FastAPI with PostgreSQL Database
- **Repository**: https://github.com/s2pl/RailSathiBE
- **Completion Date**: July 13, 2025

---

## 📋 Assignment Deliverables Status ✅

### ✅ **Required Deliverables:**
- [x] **Public GitHub Repository** with all source code
- [x] **Django/FastAPI Project** - RailSathi Backend complaint management system  
- [x] **Dockerfile** - Python 3.9-slim based containerization
- [x] **docker-compose.yml** - Multi-service orchestration (app + database)
- [x] **.env.example** - Environment configuration template
- [x] **README.md** - Comprehensive documentation with setup instructions

### ✅ **Documentation Requirements:**
- [x] **Setup Instructions** - Step-by-step guide provided
- [x] **API Usage/Endpoints** - All endpoints documented and tested
- [x] **Assumptions & Design Decisions** - Documented in limitations section

### ✅ **Functional Requirements:**
- [x] **Assignment Endpoint**: http://localhost:8000/items/ ✅ Working
- [x] **Multi-Container Setup**: App + Database ✅ Running
- [x] **Database Integration**: PostgreSQL connection ✅ Functional
- [x] **Docker Compose**: Single command deployment ✅ `docker-compose up --build`

---

### 🎯 **Assignment Completion Status: FULLY COMPLETED** ✅

## Video Presentation recording

link = "https://drive.google.com/file/d/1sN_p0cld7DLD-AOra_1XHhdz-hsE8x3I/view?usp=sharing"


