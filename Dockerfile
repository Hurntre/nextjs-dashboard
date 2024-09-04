# Base image
FROM node:21-slim

# Create app directory
WORKDIR /workspace/nextjs-dashboard/app

# copy package.json 
COPY package.json ./

# copy package.json 
COPY pnpm-lock.yaml ./

# Install performance package manager
RUN npm install -g pnpm

# Install dependencies
RUN pnpm install

# Bundle app source
COPY . .

# define dev app env, not recommended for production
ENV POSTGRES_URL=postgres://default:6uiMGW5PFJyc@ep-holy-bonus-a4efjufj-pooler.us-east-1.aws.neon.tech:5432/verceldb?sslmode=require
ENV POSTGRES_PRISMA_URL=postgres://default:6uiMGW5PFJyc@ep-holy-bonus-a4efjufj-pooler.us-east-1.aws.neon.tech:5432/verceldb?sslmode=require&pgbouncer=true&connect_timeout=15
ENV POSTGRES_URL_NO_SSL=postgres://default:6uiMGW5PFJyc@ep-holy-bonus-a4efjufj-pooler.us-east-1.aws.neon.tech:5432/verceldb
ENV POSTGRES_URL_NON_POOLING=postgres://default:6uiMGW5PFJyc@ep-holy-bonus-a4efjufj.us-east-1.aws.neon.tech:5432/verceldb?sslmode=require
ENV POSTGRES_USER=default
ENV POSTGRES_HOST=ep-holy-bonus-a4efjufj-pooler.us-east-1.aws.neon.tech
ENV POSTGRES_PASSWORD=6uiMGW5PFJyc
ENV POSTGRES_DATABASE=verceldb
ENV AUTH_SECRET=u/22xW/BMURk8EQ/EurLT/WOLHjbiGuIZPhuBELFvTQ=

# Build app
RUN pnpm run build

# Start the app
CMD ["pnpm", "run", "start"]
