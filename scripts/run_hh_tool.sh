#!/bin/bash

# Path to your project and venv (using relative paths from the script location)
HH_TOOL_DIR="$(dirname "$(dirname "$0")")"
VENV_PATH="$HH_TOOL_DIR/.venv"
LOG_DIR="$HH_TOOL_DIR/logs"
LOG_FILE="$LOG_DIR/hh_tool_$(date +%Y%m%d_%H%M%S).log"

# Create log directory if it doesn't exist
mkdir -p "$LOG_DIR"

# Activate the virtual environment
source "$VENV_PATH/bin/activate"

# Log start time
echo "---------------------------------------------" >> "$LOG_FILE"
echo "Starting job at $(date)" >> "$LOG_FILE"

# Run the tool with any needed arguments
cd "$HH_TOOL_DIR"
hh-applicant-tool -vvv apply-similar >> "$LOG_FILE" 2>&1

# Log end time
echo "Job completed at $(date)" >> "$LOG_FILE"
echo "---------------------------------------------" >> "$LOG_FILE"

# Deactivate virtual environment
deactivate
