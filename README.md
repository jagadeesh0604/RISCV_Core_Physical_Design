32-bit RISC-V Core: RTL-to-GDSII Implementation
Using OpenLane & SkyWater 130nm PDK
🚀 Project Overview

This repository contains the full physical implementation of a 32-bit RISC-V core. The project involves taking a synthesizable Verilog RTL through the complete Digital Implementation cycle—from synthesis to a DRC-clean GDSII layout.
🛠️ Toolchain & Technology

    PDK: SkyWater 130nm (Sky130A)

    Flow: OpenLane (v1.0.2)

    Synthesis: Yosys

    Floorplanning & PDN: OpenROAD

    Placement & Routing: OpenROAD (Global and Detailed)

    Signoff: Magic (GDSII Streaming), KLayout (Layout Visualization)

📈 Technical Highlights & Challenges

    Placement Congestion Relief: Initially encountered GPL-0302 density errors due to high logic complexity in a restricted area.

    Optimization: Successfully achieved placement closure by performing a floorplan sensitivity analysis, eventually scaling Core Utilization to 15% and Target Density to 0.20.

    Clock Tree Synthesis (CTS): Optimized clock distribution for a target frequency of 50MHz (20ns period).

    DRC/LVS Clean: The final design passed all Design Rule Checks with zero violations after detailed routing.

📂 Repository Structure
Plaintext

├── rtl/               # Synthesizable Verilog files (ALU, RegFile, Control Unit, etc.)

├── scripts/           # config.json and pin_order.cfg

├── results/           # Final riscv_top.gds and gate-level netlist

└── docs/              # Layout screenshots and reports

### 🖼️ Final GDSII Layout

![RISC-V Core GDSII Layout](RISCV_CORE.png)
