# Define the Flutter command
FLUTTER := flutter

# Target to clean the project
clean:
	@echo "Cleaning Flutter project..."
	$(FLUTTER) clean

# Target to get and install packages
get-packages:
	@echo "Fetching and installing packages..."
	$(FLUTTER) pub get

# Target to format the code
format:
	@echo "Formatting Flutter code..."
	$(FLUTTER) format ./lib

# Target to analyze code for issues
analyze:
	@echo "Analyzing Flutter code..."
	$(FLUTTER) analyze

# Target to run the app
run:
	@echo "Running the Flutter app..."
	$(FLUTTER) run

# Target to link packages
link:
	@echo "Linking packages (if needed)..."
	$(FLUTTER) pub global activate

# Default target (clean, get packages, and format)
all: clean get-packages format
	@echo "Project setup complete!"
