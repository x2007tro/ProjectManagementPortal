# ProjectPortal
A webapp to track project status for different lines of business

## Structure
- Navigation panel
	- Workers Compensation
	- Other
	
- Navlist panel (Workers Compensation)
	- Accounting valuation (Content panel)
	- Rate setting (Content panel)
	
- Navlist panel (Other)
	- OPEB (Content panel)
	- PNB LTD (Content panel)
	- Drug Plan (Content panel)
	
- Content panel (Universal)
	- Configuration section
		- Valuation date for valuation/Year for rate setting
	- Task section
		- Row 1
		- Step
		- Task
		- Action
		- Instruction (link to instruction section)
		- Status
		- Row 2
		- Analyst Comment
		- Save
		- Row 3
		- Consultant Comment
		- Save
	- Instruction section
		- Step
		- Details (Simple html paragraph)
		- Further Details (Simple html paragraph)
- The instruction table fields
	- Step (# for category name, numeric value for actual step)
	- File name 
	- Action
	- Comment
	- Further Comment
	
## Functionality
- The webapp
	- Loads tasks from instruction workbook
	- Save analyst and consultant comments and output the results into a CSV file
- Paragraph processing
	- Ignore the step without # or numerical values
	- '/n' will be replaced with space
	- Any sentence starting with [#?#] will be parsed into a new line
	
## Required Packages
- require(shiny)
- require(shinythemes)
- require(readxl)
- require(DT)
