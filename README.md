
![openNorthumbrianChanter](https://github.com/Z-QIAO/openNSP_Project/assets/25248611/400d6992-3876-4413-9d9f-6111e53db103)

# openNSP_Project
This open-source project aims to create a CAD file of the Northumbrian small-pipes using OpenSCAD. The CAD file is intended for research and experimental purposes, providing an accurate and modifiable 3D model based on historical measurements and chanter data. Different presets can be loaded and shared under the same licence, allowing for a collaborative and evolving design process.

## Overview

The Northumbrian small-pipes are a distinctive type of bagpipes native to Northumberland. This project utilises OpenSCAD, a script-based 3D CAD modeller, to create a detailed and accurate model of the instrument. The measurements and chanter data used in this project were provided by [Mike Nelson](https://www.machineconcepts.co.uk/smallpipes/pipe2.htm).

## Features

- **Detailed Modelling:** Accurate representation of the Northumbrian small-pipes based on traditional measurements.
- **OpenSCAD Script:** Easily modifiable script for customising and experimenting with different aspects of the design.
- **Adjustable Design:** Design can be adjusted on the fly for various research and experimental needs.
- **Preset Support:** Different presets can be added for analysis, allowing for comprehensive study and comparison.
- **Easy Sharing:** Models, codes and presets can be easily shared with the community.
- **GPL v3 License:** The project is released under the GNU General Public License v3, ensuring that it remains free and open-source.

## Roadmap

The project is continuously evolving, and the following features are planned for future releases:

- <del> **Drones and Blowpipes:** Addition of detailed models for drones and blowpipes to complete the Northumbrian small-pipes set. </del>
- **Left-handed Version:** Development of a left-handed version of the small-pipes to accommodate different player preferences.
- **Key Designs:** Introduction of various key designs to provide more options for customisation.
-  <del> **Modular Keys Options:** Implementation of modular key options to allow easy swapping and experimentation with 7-key, 9-key, 11-key, 14-key and more configurations.</del>
- **Undercuts and angled holes:** Incorporation of undercuts and angled holes for improved acoustic performance and historical accuracy.
- **Array-based parameters:** Implementation of arrays in parameters of the chanter holes to get a more user-friendly interface. (partially done)
-  <del> **Different key implements:** Presets for F, G and possible D chanters and drones in the json files.</del>
  
## Getting Started

### Prerequisites

- [OpenSCAD](https://www.openscad.org/downloads.html): Ensure you have the latest version of development built OpenSCAD installed.

### Installation

1. Clone the repository:
    ```bash
    git clone https://github.com/Z-QIAO/openNSP_Project.git
    ```
2. Navigate to the project directory:
    ```bash
    cd openNSP_Project
    ```

### Usage

#### Chanter
1. Open the `openNSP_Chanter.scad` file in OpenSCAD:

    ```bash
    openscad /chanter/openNSP_Chanter.scad
    ```
3. View, modify, and render the 3D model as needed.
4. Export the model to your preferred 3D file format for further use or 3D printing.

#### Drone tops

1. Open the `openNSP_droneTops.scad` or `openNSP_droneStands.scad` file in OpenSCAD:

```bash
openscad /drones/openNSP_droneTops.scad
```
or
```bash
openscad /drones/openNSP_droneStands.scad
```

2. Locate the section of the script that defines the drone profiles. Use the drop-down menu to select the desired drone profile.

<img width="476" alt="Screenshot 2024-07-06 at 22 51 04" src="https://github.com/Z-QIAO/openNSP_Project/assets/25248611/7110f648-ab51-4bd3-a534-c16622125d4d">

3. View, modify, and render the 3D model as needed.
4. Export the model to your preferred 3D file format for further use or 3D printing.

## Contributions

Contributions are welcome! If you have improvements, bug fixes, or new features to suggest, please create a pull request. For major changes, please open an issue to discuss your ideas.

## License

This project is licensed under the GNU General Public License v3.0. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

Special thanks to [Mike Nelson](http://www.machineconcepts.co.uk/) for providing knowledge that made this project possible.

## Disclaimer

The creator of this project is not responsible for the quality of the instrument you create using these CAD files. Any damage, injuries, or other adverse outcomes resulting from the manufacturing process or use of the instrument are solely the responsibility of the user. The CAD files and associated scripts are provided "as is" without any warranty of any kind, either expressed or implied, including but not limited to the implied warranties of merchantability, fitness for a particular purpose, or non-infringement. 

## Support

If you find this project useful, please consider buying me a coffee: [Buy me a coffee](https://buymeacoffee.com/zqiao).

For any further inquiries, please contact [me](https://www.instagram.com/zexuan_qiao/) or drop me an email: zexuan_qiao[]outlook.com

Enjoy creating and experimenting with the Northumbrian small-pipes!
