const questions = [
  {
    id: 1,
    question:
      "What command would you use to find all files modified in the last 24 hours?",
    answer: "find / -mtime -1",
    category: "File System",
    difficulty: "easy",
  },
  {
    id: 2,
    question:
      "Explain what happens when you execute 'rm -rf *' in the root directory.",
    answer:
      "This command recursively and forcibly deletes all files and directories starting from the current directory. If run as root in the root directory (/), it would delete everything on the system, making it unusable.",
    category: "File Operations",
    difficulty: "hard",
  },
  {
    id: 3,
    question: "How would you check the listening ports on a Linux system?",
    answer:
      "You can use several commands: 'netstat -tulnp', 'ss -tulnp', or 'lsof -i'",
    category: "Networking",
    difficulty: "medium",
  },
  {
    id: 4,
    question: "What's the difference between 'kill' and 'kill -9'?",
    answer:
      "'kill' sends a TERM signal (15) which allows the process to gracefully shut down. 'kill -9' sends a KILL signal (9) which forcefully terminates the process immediately, without allowing it to clean up.",
    category: "Process Management",
    difficulty: "medium",
  },
  {
    id: 5,
    question: "How would you check disk usage in Linux?",
    answer:
      "Use 'df -h' for disk space by filesystem or 'du -sh' for directory sizes.",
    category: "System Monitoring",
    difficulty: "easy",
  },
  {
    id: 6,
    question: "What is the purpose of the /etc/passwd file?",
    answer:
      "The /etc/passwd file stores user account information including username, user ID, group ID, home directory, and login shell.",
    category: "User Management",
    difficulty: "easy",
  },
  {
    id: 7,
    question:
      "How would you search for a pattern in files recursively in a directory?",
    answer:
      "Use 'grep -r pattern /path/to/directory' or 'grep -R pattern /path/to/directory'",
    category: "Text Processing",
    difficulty: "easy",
  },
  {
    id: 8,
    question: "Explain what 'umask' does in Linux.",
    answer:
      "umask sets the default permissions for newly created files and directories. It's a mask that determines which permissions are NOT set (e.g., umask 022 results in permissions of 755 for directories and 644 for files).",
    category: "File Permissions",
    difficulty: "medium",
  },
  {
    id: 9,
    question: "What is the difference between a hard link and a soft link?",
    answer:
      "A hard link is a direct reference to the inode of a file, while a soft link (symbolic link) is a pointer to another file by name. Hard links can't cross filesystems or reference directories, while soft links can.",
    category: "File System",
    difficulty: "hard",
  },
  {
    id: 10,
    question: "How would you schedule a job to run every day at 2:30 AM?",
    answer: "Add this line to crontab: '30 2 * * * /path/to/command'",
    category: "Job Scheduling",
    difficulty: "medium",
  },
];

export default questions;
