import AdminPanel from './adminPanel';

// ...existing code...

const adminPanel = new AdminPanel();

// Example usage of admin panel
adminPanel.useTool1();
adminPanel.useTool2();
adminPanel.useMonitoringTool();
const gptResponse = adminPanel.useGPTTool("Hello, GPT!");
console.log(gptResponse);
// ...use other tools...
