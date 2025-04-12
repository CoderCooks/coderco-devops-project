# 🐳 Running with Docker

Want to test the frontend locally without setting up your environment? Docker's got your back.

---

## 🔧 Step 1: Build the Docker Image

Run the following command in the root directory of your project:

```bash
docker build -t coderco-frontend .
✅ This command builds the Docker image using the Dockerfile in the root directory.
✅ It tags the image as coderco-frontend.

🚀 Step 2: Run the Docker Container
Once built, start the app with:

bash
Copy
Edit
docker run -p 3000:3000 coderco-frontend
✅ This runs the container and maps port 3000 inside the container to port 3000 on your local machine.

🌐 Step 3: Access the App
Once the container is running, open your browser and go to:

arduino
Copy
Edit
http://localhost:3000
You should see the CoderCo frontend app running! 🎉

✅ Expected Output
Terminal output should show the server starting successfully.

You’ll see logs indicating the app is listening on port 3000.

Your browser should load the app homepage without errors.

✅ Command Verification
Both the docker build and docker run commands have been tested and verified locally:

✅ The image builds successfully without errors using the Dockerfile.

✅ Running the container exposes the app on http://localhost:3000.

✅ The app loads as expected in the browser.

✅ Logs confirm the app is up and running inside the container.

css
Copy
Edit
