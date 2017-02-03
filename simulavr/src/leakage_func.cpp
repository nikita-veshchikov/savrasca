#ifndef LEAKAGE_FUNC
#define LEAKAGE_FUNC

#include<stdio.h>
#include<fstream>

// -------- leakage functions --------

// identity function
template <typename T>
double identity(T value){
	return (double)(value);
}

// Hamming Weight
template <typename T>
unsigned char hammingWeight(T value){
	unsigned char result = 0;
	while (value != 0){
		if (value % 2 == 1){
			result+=1;
		}
		value/=2;
	}
	return result;
}

// Hamming Distance
template <typename T>
unsigned char hammingDistance(T value1, T value2){
	return hammingWeight(value1^value2);
}

// XXX dirty version wth a global variable
extern std::ofstream powertrace;

template <typename T>
void leakValue_float(T val){
	char buffer[32];
	/*if (sizeof(val) == 1){
		sprintf(buffer, "0x%02X;\n", val);
	}else{
		sprintf(buffer, "0x%04X;\n", val);
	}*/
	sprintf(buffer, "%f; ", hammingWeight(val));
	/*std::ofstream outFile;
	outFile.open("powerTrace.txt", std::ofstream::out | std::ofstream::app);	
	outFile<<buffer;
	outFile.close();*/
	
	powertrace<<buffer;
}

template <typename T>
void leakTransition_float(T oldVal, T newVal){
	char buffer[32];
	//sprintf(buffer, "0x%02X->0x%02X;\n", oldVal, newVal);
	sprintf(buffer, "%f; ", hammingDistance(oldVal, newVal));
	/*
	std::ofstream outFile;
	outFile.open("powerTrace.txt", std::ofstream::out | std::ofstream::app);	
	outFile<<buffer;
	outFile.close();
	*/
	powertrace<<buffer;
}

template <typename T>
void leakValue(T val){
	unsigned char tmp = hammingWeight(val);
	powertrace.write((char*)&tmp, sizeof(tmp));
}

template <typename T>
void leakTransition(T oldVal, T newVal){
	unsigned char tmp = hammingDistance(oldVal, newVal);
	powertrace.write((char*)&tmp, sizeof(tmp));
}

#endif //LEAKAGE_FUNC
