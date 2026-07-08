import time
import json
from datetime import datetime

class PerformanceTracker:
    """Core utility for the 'tools/' folder to log application health metrics."""
    def __init__(self, service_name: str = "OmnipotentCore"):
        self.service_name = service_name
        self.metrics_log = []

    def log_metric(self, operation: str, execution_time_ms: float, status: str = "SUCCESS"):
        metric_payload = {
            "timestamp": datetime.utcnow().isoformat(),
            "service": self.service_name,
            "operation": operation,
            "latency_ms": round(execution_time_ms, 2),
            "status": status
        }
        self.metrics_log.append(metric_payload)
        print(f"[{metric_payload['status']}] {operation} took {metric_payload['latency_ms']}ms")

    def export_metrics_json(self) -> str:
        """Serializes historical tracker footprints into a transmission string."""
        return json.dumps(self.metrics_log, indent=2)

if __name__ == "__main__":
    tracker = PerformanceTracker()
    
    # Simulating standard environment tracking metrics
    start_time = time.time()
    time.sleep(0.045)  # Simulate multidimensional matrix crunching latency
    tracker.log_metric("multidimensional_tensor_load", (time.time() - start_time) * 1000)
    
    start_time = time.time()
    time.sleep(0.012)  # Simulate data bridge formatting latency
    tracker.log_metric("cobol_bridge_payload_pass", (time.time() - start_time) * 1000)
    
    print("\nHistorical Performance Log Output (JSON Format):")
    print(tracker.export_metrics_json())
