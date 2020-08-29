import sys

found_match = False
target_signature = "TestProgram$.profileMain(jobject)"
for line in sys.stdin:
    if found_match:
        sys.stdout.write(line)
    else:
        if target_signature in line:
            sys.stdout.write(line)
            found_match = True

