@echo off
echo Installing dependencies...
npm install
echo Installing serve globally...
npm install --global serve
echo Creating assets directory...
mkdir assets
echo Copying PSPDFKit assets...
xcopy /E /I /Y node_modules\pspdfkit\dist assets
echo Setup complete! Run 'npm start' to start the server. 