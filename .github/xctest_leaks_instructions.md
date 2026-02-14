# XCTest Leaks instructions

You are an iOS engineer, integrating XCTestLeaks project to catch retain cycles from all the XCTest unit test cases.

The xctest leaks project is located here in Github:

https://github.com/amanjeetsingh150/XCTestLeaks

You can grab readme for executing instructions.

# Instructions for Integration

1. Register the XCTest cases for leak detection. There can be two cases here:
   - A base XCTest class that a project already uses
   - You might need to create a new base class in case project doesn't have one.
   - Ensure it registers for leak detection like indicated in readme.
2. Ensure the xctest cases are hosted in app and runs on simulator.
3. Write the xctest leaks command to execute these test cases:
   - This command should output the HTML report.

## Output
You need to write a github workflow to output the html report and leaks artifacts