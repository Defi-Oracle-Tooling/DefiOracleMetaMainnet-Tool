import { Tool1 } from './tools/tool1';
import { Tool2 } from './tools/tool2';
import { MonitoringTool } from './tools/monitoringTool';
import { GPTTool } from './tools/gptTool';
// ...import other tools...

class AdminPanel {
    private tool1: Tool1;
    private tool2: Tool2;
    private monitoringTool: MonitoringTool;
    private gptTool: GPTTool;
    // ...other tools...

    constructor() {
        this.tool1 = new Tool1();
        this.tool2 = new Tool2();
        this.monitoringTool = new MonitoringTool();
        this.gptTool = new GPTTool();
        // ...initialize other tools...
    }

    public useTool1() {
        this.tool1.execute();
    }

    public useTool2() {
        this.tool2.execute();
    }

    public useMonitoringTool() {
        this.monitoringTool.monitor();
    }

    public useGPTTool(prompt: string) {
        return this.gptTool.generateText(prompt);
    }

    // ...methods to use other tools...
}

export default AdminPanel;
