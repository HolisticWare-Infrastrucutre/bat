sh

function download_java()
{

 }
 
function configure_java()
{
	PATH_JAVA_HOME="/home/moljac/Donwloads/usr/java/jdk1.8.0_101"
	PATH_JAVAC=$PATH_JAVA_HOME"/bin/javac"
	PATH_JAVA=$PATH_JAVA_HOME"/bin/java"

	sudo update-alternatives \
		--install \
		"/usr/bin/javac" "javac" \
		$JAVAC 1

	sudo update-alternatives \
		--install \
		"/usr/bin/java" "java" \
		$JAVA 1

	sudo update-alternatives \
		--set \
		"javac" $JAVAC

	sudo update-alternatives \
		--set \
		"java" $JAVA


	"
JAVA_HOME=\"\"
PATH=\"$PATH:$JAVA_HOME/bin\" 
export JAVA_HOME
export PATH
"

for file in $(find "$JAVA_HOME" -name "*pack")
do 
    unpack200 "${file}" "${test_file/%pack/jar}";
done

. /etc/profile

java -version



 download_java
 