# QuickFileCreate

QuickFileCreate is a simple macOS Finder app that allows users to quickly create new files with custom extensions and optionally open them in a preferred text editor.

## Features

- Create new files in the current Finder window
- Set a default text editor from popular options or choose any app
- Toggle automatic file opening after creation
- Remembers user preferences between sessions

## Installation

### Option 1: Download Pre-built App (Recommended)

1. Go to the [Releases](https://github.com/MohamedElashri/QuickFileCreate/releases) page.
2. Download the latest `QuickFileCreate.app.zip` file.
3. Unzip the file and move `QuickFileCreate.app` to your Applications folder.

This version is signed with my developer certificate.

### Option 2: Build from Source

1. Clone this repository:
   ```
   git clone https://github.com/MohamedElashri/QuickFileCreate.git
   ```
2. Open `QuickFileCreate.applescript` in Script Editor (found in Applications > Utilities).
3. Go to File > Export.
4. In the export dialog:
   - Name: "QuickFileCreate"
   - Where: Choose a location
   - File Format: Application
   - Options: Uncheck "Run-only"
5. Click "Save".

#### Adding the Icon

1. Right-click on the exported app and select "Get Info".
2. Drag `icons/icon.icns` onto the small icon in the top-left corner of the info window.

## Usage

1. Move QuickFileCreate.app to a convenient location or add it to your Finder toolbar.
2. Click on the app icon to run it.
3. Choose from the following options:
   - Create File: Enter a filename with extension to create a new file.
   - Set Default Editor: Choose your preferred text editor (Default list or add you custom one)
   - Turn Auto-Open ON/OFF: Toggle whether files open automatically after creation.
   - Quit: Exit the app.

NOTE: Make sure that the editor you add or use is actually installed
## Source Code

The main source code is in `QuickFileCreate.applescript`.

## Contributing

If you encounter any problems or have feature requests, please open an issue on the GitHub repository. Also contributions are welcome! Please feel free to submit a Pull Request. 

## License

This project is licensed under the GNU General Public License v2.0 - see the [LICENSE](LICENSE) file for details.

## Disclaimer

This software is provided "as is", without warranty of any kind, express or implied, including but not limited to the warranties of merchantability, fitness for a particular purpose and noninfringement. In no event shall the authors or copyright holders be liable for any claim, damages or other liability, whether in an action of contract, tort or otherwise, arising from, out of or in connection with the software or the use or other dealings in the software.
