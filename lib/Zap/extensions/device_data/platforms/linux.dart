// ignore_for_file: unused_element
part of '../device_info.dart';

// A class representing Linux-specific information
class _Linux {
  ///[initLinux] Initialize Linux information
  Future<_Linux> initLinux() async {
    // Retrieve operating system, CPU, and memory information
    String info = await getOperatingSystemInfo();
    String cpu = await getCPUInfo();
    String memory = await getMemoryInfo();

    // Parse the information and initialize corresponding objects
    memoryInfo = _MemoryInfo.fromText(memory);
    swapInfo = _SwapInfo.fromText(memory);
    cpuInfo = _CpuInfo.fromText(cpu);
    osInfo = _OsInfo.fromText(info);

    return this;
  }

  // Get operating system information
  Future<String> getOperatingSystemInfo() async {
    ProcessResult result = await Process.run('uname', ['-a']);
    return result.stdout.toString();
  }

  // Get CPU information
  Future<String> getCPUInfo() async {
    ProcessResult result = await Process.run('cat', ['/proc/cpuinfo']);
    return result.stdout.toString();
  }

  // Get memory information
  Future<String> getMemoryInfo() async {
    ProcessResult result = await Process.run('free', ['-m']);
    return result.stdout;
  }

  // Instance fields to store parsed information
  _MemoryInfo? memoryInfo;
  _SwapInfo? swapInfo;
  _CpuInfo? cpuInfo;
  _OsInfo? osInfo;

  // Constructor with optional named parameters
  _Linux({this.cpuInfo, this.memoryInfo, this.osInfo, this.swapInfo});
}

// A class representing memory information
class _MemoryInfo {
  int? total;
  int? used;
  int? free;
  int? shared;
  int? buffCache;
  int? available;

  // Constructor with optional named parameters
  _MemoryInfo({
    this.available,
    this.buffCache,
    this.free,
    this.shared,
    this.total,
    this.used,
  });

  // Constructor from text representation
  _MemoryInfo.fromText(String text) {
    List<String> words = text.split(RegExp(r'\s+'));
    int memIndex = words.indexOf('Mem:');

    total = int.parse(words[memIndex + 1]);
    used = int.parse(words[memIndex + 2]);
    free = int.parse(words[memIndex + 3]);
    shared = int.parse(words[memIndex + 4]);
    buffCache = int.parse(words[memIndex + 5]);
    available = int.parse(words[memIndex + 6]);
  }
}

// A class representing swap information
class _SwapInfo {
  int? total;
  int? used;
  int? free;

  // Constructor with optional named parameters
  _SwapInfo({this.total, this.used, this.free});

  // Constructor from text representation
  _SwapInfo.fromText(String text) {
    List<String> words = text.split(RegExp(r'\s+'));
    int swapIndex = words.indexOf('Swap:');

    total = int.parse(words[swapIndex + 1]);
    used = int.parse(words[swapIndex + 2]);
    free = int.parse(words[swapIndex + 3]);
  }
}

// A class representing CPU information
class _CpuInfo {
  // Fields representing various CPU information
  int? processor;
  String? vendorId;
  int? cpuFamily;
  int? model;
  String? modelName;
  int? stepping;
  String? microcode;
  double? cpuMHz;
  String? cacheSize;
  int? physicalId;
  int? siblings;
  int? coreId;
  int? cpuCores;
  int? apicid;
  int? initialApicid;
  String? fpu;
  String? fpuException;
  int? cpuidLevel;
  String? wp;
  String? flags;
  String? bugs;
  double? bogomips;
  int? tlbSize;
  int? clflushSize;
  int? cacheAlignment;
  String? addressSizes;
  String? powerManagement;

  // Constructor with optional named parameters
  _CpuInfo({
    this.addressSizes,
    this.apicid,
    this.bogomips,
    this.bugs,
    this.cacheAlignment,
    this.cacheSize,
    this.clflushSize,
    this.coreId,
    this.cpuCores,
    this.cpuFamily,
    this.cpuMHz,
    this.cpuidLevel,
    this.flags,
    this.fpu,
    this.fpuException,
    this.initialApicid,
    this.model,
    this.modelName,
    this.microcode,
    this.physicalId,
    this.powerManagement,
    this.processor,
    this.siblings,
    this.stepping,
    this.tlbSize,
    this.vendorId,
    this.wp,
  });

  // Constructor from text representation
  _CpuInfo.fromText(String text) {
    Map<String, dynamic> keyValuePairs = {};

    // Split the string into sections for each processor
    List<String> processorSections = text.split("processor\n");

    for (String section in processorSections) {
      // Split the section into lines
      List<String> lines = section.trim().split("\n");

      for (String line in lines) {
        // Extract the key and value from each line
        List<String> parts = line.split(":");
        if (parts.length == 2) {
          String key = parts[0].trim();
          String value = parts[1].trim();

          // Handle multi-line values
          if (value.endsWith("\n")) {
            value = value.substring(0, value.length - 1);
          }

          keyValuePairs[key] = value;
        }
      }
    }

    // Assign values to corresponding fields
    processor = int.tryParse(keyValuePairs['processor'] ?? '');
    vendorId = keyValuePairs['vendor_id'];
    cpuFamily = int.tryParse(keyValuePairs['cpu_family'] ?? '');
    model = int.tryParse(keyValuePairs['model'] ?? '');
    modelName = keyValuePairs['model name'];
    stepping = int.tryParse(keyValuePairs['stepping'] ?? '');
    microcode = keyValuePairs['microcode'];
    cpuMHz = double.tryParse(keyValuePairs['cpu MHz'] ?? '');
    cacheSize = keyValuePairs['cache size'];
    physicalId = int.tryParse(keyValuePairs['physical id'] ?? '');
    siblings = int.tryParse(keyValuePairs['siblings'] ?? '');
    coreId = int.tryParse(keyValuePairs['core id'] ?? '');
    cpuCores = int.tryParse(keyValuePairs['cpu cores'] ?? '');
    apicid = int.tryParse(keyValuePairs['apicid'] ?? '');
    initialApicid = int.tryParse(keyValuePairs['initial apicid'] ?? '');
    fpu = keyValuePairs['fpu'];
    fpuException = keyValuePairs['fpu_exception'];
    cpuidLevel = int.tryParse(keyValuePairs['cpuid level'] ?? '');
    wp = keyValuePairs['wp'];
    flags = keyValuePairs['flags'];
    bugs = keyValuePairs['bugs'];
    bogomips = double.tryParse(keyValuePairs['bogomips'] ?? '');
    tlbSize = int.tryParse(keyValuePairs['TLB size'] ?? '');
    clflushSize = int.tryParse(keyValuePairs['clflush size'] ?? '');
    cacheAlignment = int.tryParse(keyValuePairs['cache_alignment'] ?? '');
    addressSizes = keyValuePairs['address sizes'];
    powerManagement = keyValuePairs['power management'];
  }
}

// A class representing OS information
class _OsInfo {
  String? os;
  String? distribution;
  String? version;
  String? kernel;
  String? architecture;
  String? additionalInfo;

  // Constructor with optional named parameters
  _OsInfo({
    this.additionalInfo,
    this.architecture,
    this.distribution,
    this.kernel,
    this.os,
    this.version,
  });

  // Constructor from text representation
  _OsInfo.fromText(String text) {
    // Organize system information into a map
    Map<String, String> systemInfo = organizeSystemInfo(text);

    // Assign values to corresponding fields
    os = systemInfo['os'] ?? '';
    distribution = systemInfo['distribution'] ?? '';
    version = systemInfo['version'] ?? '';
    kernel = systemInfo['kernel'] ?? '';
    architecture = systemInfo['architecture'] ?? '';
    additionalInfo = systemInfo['additionalInfo'] ?? '';
  }

  // Organize system information into a map
  Map<String, String> organizeSystemInfo(String systemInfoText) {
    List<String> systemInfoParts = systemInfoText.split(' ');

    Map<String, String> organizedInfo = {
      'os': systemInfoParts[0],
      'distribution': systemInfoParts[1],
      'version': systemInfoParts[2],
      'kernel': systemInfoParts[3],
      'architecture': systemInfoParts[4],
      'additionalInfo': systemInfoParts.sublist(5).join(' '),
    };

    return organizedInfo;
  }
}

